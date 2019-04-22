/*********************************************************************
 *                                                                   *
 * MODULE NAME :  create.c               AUTHOR:  Rick Fishman       *
 * DATE WRITTEN:  10-09-92                                           *
 *                                                                   *
 * DESCRIPTION:                                                      *
 *                                                                   *
 *  This module is part of CNRBASE.EXE. It performs the function of  *
 *  creating the container window and starting a thread that will    *
 *  populate the window with file icons.                             *
 *                                                                   *
 *  The primary purpose of this module is to create the container    *
 *  and set it up to be able to switch views easily. This is         *
 *  accomplished by creating the column definitions for the Details  *
 *  view. The Details view is really the only view that requires     *
 *  any substantial setup.                                           *
 *                                                                   *
 *  We also set the base directory here. This directory will be      *
 *  traversed in the PopulateContainer thread as will all its        *
 *  subdirectories. If the user entered a directory name on the      *
 *  command line we don't need to do anything. If not, we get the    *
 *  current drive and directory and use it as the base.              *
 *                                                                   *
 * CALLABLE FUNCTIONS:                                               *
 *                                                                   *
 *   HWND CreateDirectoryWin( PSZ szDirectory );                     *
 *   HWND CreateContainer( HWND hwndClient, PSZ szDirectory );       *
 *                                                                   *
 * HISTORY:                                                          *
 *                                                                   *
 *  10-09-92 - Program coded                                         *
 *                                                                   *
 *  Rick Fishman                                                     *
 *  Code Blazers, Inc.                                               *
 *  4113 Apricot                                                     *
 *  Irvine, CA. 92720                                                *
 *  CIS ID: 72251,750                                                *
 *                                                                   *
 *********************************************************************/

#pragma strings(readonly)   // used for debug version of memory mgmt routines

/*********************************************************************/
/*------- Include relevant sections of the OS/2 header files --------*/
/*********************************************************************/

#define  INCL_WINERRORS
#define  INCL_WINFRAMEMGR
#define  INCL_WINSTDCNR
#define  INCL_WINWINDOWMGR
#define  INCL_WIN

/**********************************************************************/
/*----------------------------- INCLUDES -----------------------------*/
/**********************************************************************/

#include <os2.h>
#include <process.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "address.h"

/*********************************************************************/
/*------------------- APPLICATION DEFINITIONS -----------------------*/
/*********************************************************************/

#define FRAME_FLAGS         (FCF_TASKLIST | FCF_TITLEBAR   | FCF_SYSMENU | \
                             FCF_MINMAX   | FCF_SIZEBORDER | FCF_MENU    | \
                             FCF_SHELLPOSITION)

#define FILES_TO_GET        100         // Nbr of files to search for at a time
#define FF_BUFFSIZE         (sizeof( FILEFINDBUF3 ) * FILES_TO_GET)

#define CONTAINER_COLUMNS   5           // Number of columns in details view

#define SPLITBAR_OFFSET     150         // Pixel offset of details splitbar

#define THREAD_STACKSIZE    65536       // Stacksize for secondary thread

/**********************************************************************/
/*---------------------------- STRUCTURES ----------------------------*/
/**********************************************************************/

/**********************************************************************/
/*----------------------- FUNCTION PROTOTYPES ------------------------*/
/**********************************************************************/

static BOOL SetContainerColumns( HWND hwndCnr );
static VOID GetCurrentDirectory( PSZ pszDirectory );
static VOID UseCmdLineDirectory( PSZ pszDirectoryOut, PSZ szDirectoryIn );
// static BOOL  ReadIni  ( PVOID pini);


/**********************************************************************/
/*------------------------ GLOBAL VARIABLES --------------------------*/
/**********************************************************************/

/**********************************************************************/
/*----------------------- CreateDirectoryWin -------------------------*/
/*                                                                    */
/*  CREATE A DIRECTORY WINDOW MADE UP OF FRAME/CLIENT/CONTAINER.      */
/*                                                                    */
/*  INPUT: directory to represent in the window                       */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: window handle of created frame or NULLHANDLE if error     */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
HWND CreateDirectoryWin( PSZ szDirectory )
{
    FRAMECDATA  fcdata;
//    HWND        hwndFrame, hwndClient = NULLHANDLE;

    (void) memset( &fcdata, 0, sizeof( FRAMECDATA ) );

    fcdata.cb               = sizeof( FRAMECDATA );
    fcdata.flCreateFlags    = FRAME_FLAGS;
    fcdata.idResources      = ID_RESOURCES;

    // Create the frame window. If we were creating multiple instances of
    // this window, iWinCount would become useful.

    hwndFrame = WinCreateWindow( HWND_DESKTOP, WC_FRAME, NULL, 0, 0, 0, 0, 0,
                                 NULLHANDLE, HWND_TOP,
                                 ID_FIRST_DIRWINDOW + iWinCount, &fcdata,
                                 NULL );

    // Create the client window which will create the container in its
    // WM_CREATE processing. If that fails, hwndClient will be NULLHANDLE.
    // We pass the directory name in the CTLDATA parameter which will be
    // received by the client in mp1 on WM_CREATE.

    if( hwndFrame )
        hwndClient = WinCreateWindow( hwndFrame, DIRECTORY_WINCLASS, NULL, 0,
                                      0, 0, 0, 0, NULLHANDLE, HWND_TOP,
                                      FID_CLIENT, szDirectory, NULL );

    if( hwndClient )
    {
        // Show the frame window (it was created invisible)

        if( !WinShowWindow( hwndFrame, TRUE ) )
        {
            hwndFrame = NULLHANDLE;

            Msg( "hwndFrame WinShowWindow RC(%X)", HWNDERR( hwndClient ) );
        }
    }
    else
        hwndFrame = NULLHANDLE;

    return hwndFrame;
}

/**********************************************************************/
/*------------------------- CreateContainer --------------------------*/
/*                                                                    */
/*  CREATE THE CONTAINER AND CUSTOMIZE IT.                            */
/*                                                                    */
/*  INPUT: client window handle,                                      */
/*         directory to display in the container                      */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: Container window handle                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
HWND CreateContainer( HWND hwndClient, PSZ szDirectory )
{
    PINSTANCE pi = INSTDATA( hwndClient );
    HWND      hwndCnr = NULLHANDLE;

    if( !pi )
    {
        Msg( "CreateContainer cant get Inst data. RC(%X)", HWNDERR(hwndClient));

        return NULLHANDLE;
    }

    // Create the container control. Indicate that we want to use
    // MINIRECORDCORE structures rather than RECORDCORE structures. This
    // saves memory.

    hwndContainer = WinCreateWindow( hwndClient, WC_CONTAINER, NULL,
                               CCS_MINIRECORDCORE | WS_VISIBLE, 0, 0, 0, 0,
                               hwndClient, HWND_TOP, CNR_DIRECTORY, NULL, NULL);

    if( hwndContainer )
    {
        if( SetContainerColumns( hwndContainer ) )
        {
            PTHREADPARMS ptp = malloc( sizeof( THREADPARMS ) );

            if( ptp )
            {
                TID tid;

                (void) memset( ptp, 0, sizeof( THREADPARMS ) );

                // If no directory was passed to us, assume that the current
                // directory is to be displayed.

                if( !szDirectory )
                    GetCurrentDirectory( pi->szDirectory );
                else
                    UseCmdLineDirectory( pi->szDirectory, szDirectory );

                ptp->hwndClient = hwndClient;

                // Start the thread that will populate the container with
                // file icons. This is a separate thread because it could take
                // a while if there are many subdirectories.

                tid = _beginthread( PopulateContainer, NULL, THREAD_STACKSIZE,
                                    (PVOID) ptp );

                if( (INT) tid == -1 )
                    Msg( "Cant start PopulateContainer thread!" );
            }
            else
            {
                hwndContainer = NULLHANDLE;

                Msg( "Out of Memory in CreateContainer!" );
            }
        }
        else
            hwndContainer = NULLHANDLE;
    }
    else
        Msg( "Couldnt create container. RC(%X)", HWNDERR( hwndClient ) );

    return hwndContainer;
}

/**********************************************************************/
/*----------------------- SetContainerColumns ------------------------*/
/*                                                                    */
/*  SET THE COLUMNS OF THE CONTAINER FOR DETAIL VIEW                  */
/*                                                                    */
/*  INPUT: container window handle                                    */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: TRUE or FALSE if successful or not                        */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static BOOL SetContainerColumns( HWND hwndCnr )
{
    BOOL        fSuccess = TRUE;
    PFIELDINFO  pfi, pfiLastLeftCol;

    // Allocate storage for container column data

    pfi = WinSendMsg( hwndCnr, CM_ALLOCDETAILFIELDINFO,
                      MPFROMLONG( CONTAINER_COLUMNS ), NULL );

    if( pfi )
    {
        PFIELDINFO      pfiFirst;
        FIELDINFOINSERT fii;

        // Store original value of pfi so we won't lose it when it changes.
        // This will be needed on the CM_INSERTDETAILFIELDINFO message.

        pfiFirst = pfi;

        // Fill in column information for the icon column

        pfi->flData     = CFA_BITMAPORICON | CFA_HORZSEPARATOR | CFA_CENTER |
                          CFA_SEPARATOR;
        pfi->flTitle    = CFA_CENTER | CFA_FITITLEREADONLY;
        pfi->pTitleData = "Icon";
        pfi->offStruct  = FIELDOFFSET( CNRITEM, hptrIcon );

        // Fill in column information for the file name. Note that we are
        // using the pszFileName variable rather than szFileName. We do this
        // because the container needs a pointer to the file name. If we used
        // szFileName (a character array, not a pointer), the container would
        // take the first 4 bytes of szFileName and think it was a pointer,
        // which of course it is not. Later in the FillInRecord function we set
        // pszFileName to point to szFileName.

        pfi             = pfi->pNextFieldInfo;
        pfi->flData     = CFA_STRING | CFA_LEFT | CFA_HORZSEPARATOR;
        pfi->flTitle    = CFA_CENTER | CFA_FITITLEREADONLY;
        pfi->pTitleData = "Adressdateiname";
        pfi->offStruct  = FIELDOFFSET( CNRITEM, pszFileName );

        // Store the current pfi value as that will be used to indicate the
        // last column in the lefthand container window (we have a splitbar)

        pfiLastLeftCol = pfi;

        // Fill in column information for the file size

        pfi             = pfi->pNextFieldInfo;
        pfi->flData     = CFA_ULONG | CFA_RIGHT | CFA_HORZSEPARATOR |
                          CFA_SEPARATOR;
        pfi->flTitle    = CFA_CENTER | CFA_FITITLEREADONLY;
        pfi->pTitleData = "Dateigr”áe";
        pfi->offStruct  = FIELDOFFSET( CNRITEM, cbFile );

        // Fill in column information for file date

        pfi             = pfi->pNextFieldInfo;
        pfi->flData     = CFA_DATE | CFA_RIGHT | CFA_HORZSEPARATOR |
                          CFA_SEPARATOR;
        pfi->flTitle    = CFA_CENTER | CFA_FITITLEREADONLY;
        pfi->pTitleData =  "Datum";
        pfi->offStruct  = FIELDOFFSET( CNRITEM, date );

        // Fill in column information for the file time

        pfi             = pfi->pNextFieldInfo;
        pfi->flData     = CFA_TIME | CFA_RIGHT | CFA_HORZSEPARATOR;
        pfi->flTitle    = CFA_CENTER | CFA_FITITLEREADONLY;
        pfi->pTitleData = "Uhrzeit";
        pfi->offStruct  = FIELDOFFSET( CNRITEM, time );

        // Use the CM_INSERTDETAILFIELDINFO message to tell the container
        // all the column information it needs to function properly. Place
        // this column info first in the column list and update the display
        // after they are inserted (fInvalidateFieldInfo = TRUE)

        (void) memset( &fii, 0, sizeof( FIELDINFOINSERT ) );

        fii.cb                   = sizeof( FIELDINFOINSERT );
        fii.pFieldInfoOrder      = (PFIELDINFO) CMA_FIRST;
        fii.cFieldInfoInsert     = (SHORT) CONTAINER_COLUMNS;
        fii.fInvalidateFieldInfo = TRUE;

        if( !WinSendMsg( hwndCnr, CM_INSERTDETAILFIELDINFO, MPFROMP( pfiFirst ),
                         MPFROMP( &fii ) ) )
        {
            fSuccess = FALSE;

            Msg( "CM_INSERTDETAILFIELDINFO RC(%X)", HWNDERR( hwndCnr ) );
        }
    }
    else
    {
        fSuccess = FALSE;

        Msg( "CM_ALLOCDETAILFIELDINFO failed. RC(%X)", HWNDERR( hwndCnr ) );
    }

    if( fSuccess )
    {
        CNRINFO cnri;

        // Tell the container about the splitbar and where it goes

        cnri.cb             = sizeof( CNRINFO );
        cnri.pFieldInfoLast = pfiLastLeftCol;
        cnri.xVertSplitbar  = SPLITBAR_OFFSET;

        if( !WinSendMsg( hwndCnr, CM_SETCNRINFO, MPFROMP( &cnri ),
                        MPFROMLONG( CMA_PFIELDINFOLAST | CMA_XVERTSPLITBAR ) ) )
        {
            fSuccess = FALSE;

            Msg( "SetContainerColumns CM_SETCNRINFO RC(%X)", HWNDERR(hwndCnr) );
        }
    }

    return fSuccess;
}

/**********************************************************************/
/*----------------------- GetCurrentDirectory ------------------------*/
/*                                                                    */
/*  GET THE CURRENT DIRECTORY AND STORE IT.                           */
/*                                                                    */
/*  INPUT: pointer to buffer in which to place path info              */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static VOID GetCurrentDirectory( PSZ pszDirectory )
{
    ULONG  cbDirPath = CCHMAXPATH;
    APIRET rc;
    ULONG  ulCurrDrive, ulDrvMap;

    // Set up the "d:\" string to which we will add the current directory.
    // If we can get the current drive number, use it. Otherwise default to
    // C:

    rc = DosQueryCurrentDisk( &ulCurrDrive, &ulDrvMap );

    if( !rc )
    {
        pszDirectory[ 0 ] = ulCurrDrive + ('A' - 1);

        (void) strcpy( pszDirectory + 1, ":\\" );
    }
    else
        (void) strcpy( pszDirectory, "C:\\" );

    rc = DosQueryCurrentDir( 0, pszDirectory + 3, &cbDirPath );

    // If good retcode, DosQueryCurrentDir just returns the current
    // directory without a trailing backslash. Of course there are always
    // complications. The complication here is that if the current directory is
    // the root, the string *will* end with a backslash. So if the trailing
    // character is a backslash, remove it so we have a pure directory name.

    if( pszDirectory[ strlen( pszDirectory ) - 1 ] == '\\' )
        pszDirectory[ strlen( pszDirectory ) - 1 ] = 0;

    if( rc )
        Msg( "DosQueryCurrentDir RC(%X). Using Root Directory.", rc );
}

/**********************************************************************/
/*----------------------- UseCmdLineDirectory ------------------------*/
/*                                                                    */
/*  TAKE THE DIRECTORY FROM THE COMMANDLINE AND VALIDATE IT.          */
/*                                                                    */
/*  INPUT: pointer to buffer in which to place correct path,          */
/*         directory input at the commandline                         */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static VOID UseCmdLineDirectory( PSZ pszDirectoryOut, PSZ szDirectoryIn )
{
    (void) strcpy( pszDirectoryOut, szDirectoryIn );

    // If the user ended their directory name with a backslash, take it off
    // because this program needs to have just the base directory name here.

    if( pszDirectoryOut[ strlen( pszDirectoryOut ) - 1 ] == '\\' )
        pszDirectoryOut[ strlen( pszDirectoryOut ) - 1 ] = 0;
}

VOID CreateTrace ( PINIDATA pini )
{
        hwndTrace = WinCreateWindow ( hwndFrame,
                          WC_LISTBOX,
                          "",
                          LS_HORZSCROLL,
                          4,3,
                          530,390,    // 420,189
                          hwndFrame,
                          HWND_TOP,
                          ID_Trace,
                          NULL, NULL);
        return;
}

/*************************************************************************
 *  Ini-Datei lesen, Felder in Struktur INIDATA fllen                    *
       CHAR szIniFile[ CCHMAXPATH ];               // Name Ini-Datei gefllt
       CHAR Main_Dir[CCHMAXPATH ];        // Directory der Adreádateien - returned
       CHAR CommPort[5];                    // Modem Communication Port - returned
       CHAR BaudRate[6];                    // šbertragungsrate des Modems - returned
       CHAR WahlPT[2];                      // Puls- oder Tonwahl           - returned
       CHAR Fontfr[30];                      // font for frame                  - returned
       CHAR Fontco[30];                      // font Container                 - returned
       CHAR Fonttr[30];                     // font for trace window           - returned
       CHAR Fontd[30];                      // font for data                    - returned

 *************************************************************************/
BOOL  ReadIni  ( PINIDATA pini)
{
        HFILE   hfile;
        PVOID   Gm1;
        PCHAR   Gm2, PS1;
        FILESTATUS   FileStatus;
        ULONG   cbRead, Aktion, Result;
        APIRET  rc;
        INT     j;

        if (rc = DosOpen(pini->szIniFile,&hfile,&Aktion,
                0,0L,OPEN_ACTION_OPEN_IF_EXISTS,
                OPEN_ACCESS_READONLY | OPEN_SHARE_DENYNONE,0L)!=0)
                {
                sprintf(pini->sprintfb,"Openerror Rc = %ld on Dialogad.Ini. Sicherstellen, daá INI-Datei vorhanden.",
                         rc);
                WriteTrace ( pini, pini->sprintfb );
                WinSetWindowText(pini->hwndMsg2, pini->sprintfb);
                MsgBoxSenden(pini, pini->sprintfb );
                return FALSE;
                }
        DosQueryFileInfo(hfile, 1, &FileStatus, sizeof(FileStatus));

        if ( DosAllocMem(&Gm1, FileStatus.cbFileAlloc,
                 PAG_WRITE | PAG_READ | PAG_COMMIT) !=0)
                {
                sprintf(pini->sprintfb,"Getmainerror vor Lesen INI-Datei mit %ld Bytes.\n",
                                  FileStatus.cbFileAlloc);
                WriteTrace(pini, pini->sprintfb);
                WinSetWindowText(pini->hwndMsg2, pini->sprintfb);
                return FALSE;
                }
        Gm2 = Gm1;
        DosRead(hfile,Gm2,FileStatus.cbFileAlloc,&cbRead);
        DosClose(hfile);

        do
                {
                PS1 = strchr(Gm2,'\r');
                if (PS1 == 0)
                        {
                        PS1 = strchr(Gm2,'\n');
                        if (PS1 == 0)
                                {
                                sprintf(pini->sprintfb,"read_Ini: EOR not found. cbRead = %d, %s.", cbRead, Gm2);
                                WriteTrace(pini, pini->sprintfb);
                                WinSetWindowText(pini->hwndMsg2, pini->sprintfb);
                                return FALSE;
                                }
                        }
                memset (PS1, 0, 1);

                Result = memcmp(Gm2, "adressen:", 9);
                if (Result == 0)
                        {
                        strcpy(pini->MainDir, Gm2+9);
                        sprintf(pini->sprintfb, "INI-Datei lesen: Verzeichnis der Adressdateien = %s", pini->MainDir);
                        WriteTrace(pini, pini->sprintfb);
                        }

                Result = memcmp(Gm2, "com:", 4);
                if (Result == 0)
                        {
                        strcpy (pini->CommPort, Gm2+4);
                        sprintf(pini->sprintfb, "INI-Datei lesen: Communication Port = %s", pini->CommPort);
                        WriteTrace(pini, pini->sprintfb);
                        }

                Result = memcmp(Gm2, "baud:", 5);
                if (Result == 0)
                        {
                        strcpy (pini->BaudRate, Gm2+5);
                        if(memcmp(pini->BaudRate, "14400", 5) == 0)
                                pini->usBPS = 14400;
                        if(memcmp(pini->BaudRate, "28800", 5) == 0)
                                pini->usBPS = 28800;
                        sprintf(pini->sprintfb, "INI-Datei lesen: Baudrate = %d", pini->usBPS);
                        WriteTrace(pini, pini->sprintfb);
                        }

                Result = memcmp(Gm2, "wahl:", 5);
                if (Result == 0)
                        {
                        strcpy (pini->WahlPT, Gm2+5);
                        sprintf(pini->sprintfb, "INI-Datei lesen: Wahlmodus = %s", pini->WahlPT);
                        WriteTrace(pini, pini->sprintfb);
                        }

                Result = memcmp(Gm2, "fontfr:", 7);     // fonts for framewindow
                if (Result == 0)
                        {
                        strcpy (pini->Fontfr, Gm2+7);
                        sprintf(pini->sprintfb, "INI-Datei lesen: Font fr Frame Menu = %s", pini->Fontfr);
                        WriteTrace(pini, pini->sprintfb);
                        }

                Result = memcmp(Gm2, "fontco:", 7);     // fonts for addresswindow
                if (Result == 0)
                        {
                        strcpy (pini->Fontco, Gm2+7);
                        sprintf(pini->sprintfb, "INI-Datei lesen: Font fr Adressdateien = %s", pini->Fontco);
                        WriteTrace(pini, pini->sprintfb);
                        }

                Result = memcmp(Gm2, "fonttr:", 7);     // fonts for tracewindow
                if (Result == 0)
                        {
                        strcpy (pini->Fonttr, Gm2+7);
                        sprintf(pini->sprintfb, "INI-Datei lesen: Font fr Tracewindow = %s", pini->Fonttr);
                        WriteTrace(pini, pini->sprintfb);
                        }

                Result = memcmp(Gm2, "fontd:", 7);     // fonts for msg1window
                if (Result == 0)
                        {
                        strcpy (pini->Fontd, Gm2+7);
                        sprintf(pini->sprintfb, "INI-Datei lesen: Font fr restliche Windows = %s", pini->Fontd);
                        WriteTrace(pini, pini->sprintfb);
                        }

                j = PS1 - Gm2; j += 2;
                Gm2 += j; cbRead -= j;
                }
        while (cbRead > 1);
        DosFreeMem(Gm1);

        return TRUE;
}
/*************************************************************************
 *                     E N D     O F     S O U R C E                     *
 *************************************************************************/

