/*********************************************************************
 *                                                                   *
 * MODULE NAME :  address.c              AUTHOR:  Rick Fishman       *
 * DATE WRITTEN:  10-09-92                                           *
 *                                                                   *
 * HOW TO RUN THIS PROGRAM:                                          *
 *                                                                   *
 *  By just entering address on the command line, a container will   *
 *  be created that will contain the files in the current directory. *
 *  Any subdirectories will be included and expandable in Tree view. *
 *  The container starts in Tree view and a menu lets you switch     *
 *  between the other supported views.                               *
 *                                                                   *
 *  Optionally enter 'address directory' and that directory will be  *
 *  displayed.                                                       *
 *                                                                   *
 * MODULE DESCRIPTION:                                               *
 *                                                                   *
 *  Root module for address.EXE, a program that demonstrates the     *
 *  base functionality of a container control. This module contains  *
 *  the client window procedure and all the supporting functions for *
 *  the container messages.                                          *
 *                                                                   *
 *  This sample creates a simple Directory folder that displays      *
 *  icons for each file in a directory. It shows the Details, Name,  *
 *  Icon, and Tree views and lets the user switch between them. It   *
 *  shows simple direct-editing. The main purpose for this sample is *
 *  to demonstrate the process of creating a functional container,   *
 *  not to show its use once created.                                *
 *                                                                   *
 *  The container is populated with records from a secondary thread. *
 *  This is done not to complicate things but to let the user        *
 *  interact with the container before it is completely filled if we *
 *  are traversing a directory with many subdirectories.             *
 *                                                                   *
 *  Drag/Drop, Deltas, Context Menus, Ownerdraw, MiniIcons,          *
 *  record-sharing, sorting are not demonstrated in this sample      *
 *  program.                                                         *
 *                                                                   *
 * OTHER MODULES:                                                    *
 *                                                                   *
 *  create.c -   contains the code used to create and tailor the     *
 *               container. Once the container is created there are  *
 *               no functions called in this module.                 *
 *                                                                   *
 *  populate.c - contains the code for the thread used to fill the   *
 *               container with records.                             *
 *                                                                   *
 *  common.c -   contains common support routines for address.EXE.   *
 *                                                                   *
 * NOTES:                                                            *
 *                                                                   *
 *  This program loses some simplicity by using PM programming       *
 *  techniques that most non-beginner programmers use such as the    *
 *  use of multiple threads, Window Words and error checking. These  *
 *  techniques are not necessary for this sample and this sample     *
 *  would be easier to understand if they were not used. I believe   *
 *  the benefits outweigh the drawbacks because this program will    *
 *  now serve as a more useful template. It will also more easily    *
 *  allow for the creation of multiple instances of the sample       *
 *  Directory window, which will become important in any program     *
 *  that builds on this one.                                         *
 *                                                                   *
 *  I hope this code proves useful for other PM programmers. The     *
 *  more of us the better!                                           *
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

#define INCL_DOSERRORS
#define INCL_WINDIALOGS
#define INCL_WINERRORS
#define INCL_WINFRAMEMGR
#define INCL_WINMLE
#define INCL_WINSTDCNR
#define INCL_WINSTDDLGS
#define INCL_WINWINDOWMGR
#define INCL_WIN
#define INCL_GPI

#define GLOBALS_DEFINED        // This module defines the globals in address.h

/**********************************************************************/
/*----------------------------- INCLUDES -----------------------------*/
/**********************************************************************/

#include <os2.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "address.h"
#include "modemdlg.h"
#include "fontsdlg.h"

/*********************************************************************/
/*------------------- APPLICATION DEFINITIONS -----------------------*/
/*********************************************************************/

/**********************************************************************/
/*---------------------------- STRUCTURES ----------------------------*/
/**********************************************************************/

/**********************************************************************/
/*----------------------- FUNCTION PROTOTYPES ------------------------*/
/**********************************************************************/

       INT   main               ( INT iArgc, PSZ szArg[] );
static BOOL  InitClient         ( HWND hwndClient, PSZ szDirectory );
static VOID  SetContainerView   ( HWND hwndClient, ULONG ulViewType );
static VOID  KeepCnrAspectRatio ( HWND hwndClient, ULONG cxNew, ULONG cyNew );
static VOID  CnrBeginEdit       ( HWND hwndClient, PCNREDITDATA pced );
static VOID  CnrEndEdit         ( HWND hwndClient, PCNREDITDATA pced );
static ULONG GetMaxNameSize     ( CHAR chDrive );
static VOID  ContainerFilled    ( HWND hwndClient );
static VOID  UserWantsToClose   ( HWND hwndClient );
static VOID  FreeResources      ( HWND hwndClient );
MRESULT EXPENTRY DialogModem (HWND hwnd,ULONG msg,MPARAM mp1,MPARAM mp2);
MRESULT EXPENTRY DialogFonts (HWND hwnd,ULONG msg,MPARAM mp1,MPARAM mp2);
VOID DlgDropDown(HWND hwndDlg );
VOID FillCombobox ( HWND hwnd );

FNWP wpClient;

/**********************************************************************/
/*------------------------ GLOBAL VARIABLES --------------------------*/
/**********************************************************************/

/**********************************************************************/
/*------------------------------ MAIN --------------------------------*/
/*                                                                    */
/*  PROGRAM ENTRYPOINT                                                */
/*                                                                    */
/*  INPUT: command line                                               */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: return code                                               */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
INT main( INT iArgc, PSZ szArg[] )
{
    BOOL  fSuccess = FALSE;
    HAB   hab;
    HMQ   hmq = NULLHANDLE;
    QMSG  qmsg;
    PSZ   szStartingDir = NULL;
//    HWND  hwndFrame = NULLHANDLE;

    // This macro is defined for the debug version of the C Set/2 Memory
    // Management routines. Since the debug version writes to stderr, we
    // send all stderr output to a debuginfo file. Look in MAKEFILE to see how
    // to enable the debug version of those routines.

#ifdef __DEBUG_ALLOC__
    freopen( DEBUG_FILENAME, "w", stderr );
#endif

    // Get the directory to display from the command line if specified.

    if( iArgc > 1 )
        szStartingDir = szArg[ 1 ];

    hab = WinInitialize( 0 );

    if( hab )
        hmq = WinCreateMsgQueue( hab, 0 );
    else
    {
        DosBeep( 1000, 100 );

        (void) fprintf( stderr, "WinInitialize failed!" );
    }

    if( hmq )

        // CS_SIZEREDRAW needed for initial display of the container in the
        // client window. Allocate enough extra bytes for 1 window word.

        fSuccess = WinRegisterClass( hab, DIRECTORY_WINCLASS, wpClient,
                                     CS_SIZEREDRAW, sizeof( PVOID ) );
    else
    {
        DosBeep( 1000, 100 );

        (void) fprintf( stderr, "WinCreateMsgQueue RC(%X)", HABERR( hab ) );
    }

    if( fSuccess )

        // CreateDirectoryWin is in CREATE.C

        hwndFrame = CreateDirectoryWin( szStartingDir );
    else
        Msg( "WinRegisterClass RC(%X)", HABERR( hab ) );

    if( hwndFrame )
        while( WinGetMsg( hab, &qmsg, NULLHANDLE, 0, 0 ) )
            (void) WinDispatchMsg( hab, &qmsg );

    if( hmq )
        (void) WinDestroyMsgQueue( hmq );

    if( hab )
        (void) WinTerminate( hab );

#ifdef __DEBUG_ALLOC__
    _dump_allocated( -1 );
#endif

    return 0;
}

/**********************************************************************/
/*---------------------------- wpClient ------------------------------*/
/*                                                                    */
/*  CLIENT WINDOW PROCEDURE FOR THE DIRECTORY WINDOW.                 */
/*                                                                    */
/*  NOTE: This window is created by CreateDirectoryWin in CREATE.C    */
/*                                                                    */
/*  INPUT: standard window procedure parameters                       */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: result of message processing                              */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
MRESULT EXPENTRY wpClient( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2 )
{
        HWND hwndFocus = 0;
        HDC           hdc;
        HAB           hab;
        HPS           hps;
        APIRET       rc;
        SIZEL         sizel = {0,0};
        LONG         cFonts;

    switch( msg )
    {
        case WM_CREATE:

            // If window initialization fails, don't create window

            if( InitClient( hwnd, (PSZ) mp1 ) )
            {
                WinSetFocus(HWND_DESKTOP, hwndContainer);
                iWinCount++;
                pini = malloc ( sizeof ( INIDATA ) );
                CreateTrace ( pini );           //  Tracewindow
                if ( hwndTrace == 0)
                   {
                   strcpy ( pini->sprintfb, "Tracewindow ist nicht aufgebaut. hwnd = 0.");
                   MsgBoxSenden ( pini, pini->sprintfb);
                   }
                strcpy ( pini->szIniFile, "address.ini" );
                if ( ReadIni ( pini ) == FALSE)
                   {
                   strcpy ( pini->sprintfb, "ReadIni ist mit FALSE zurckgekommen." );
                   MsgBoxSenden ( pini, pini->sprintfb );
                   WinShowWindow ( hwndTrace, TRUE );
                   WinShowWindow ( hwnd, FALSE );
                   }
                WinSetPresParam(hwndTrace, PP_FONTNAMESIZE,
                    (LONG)strlen( pini->Fonttr ) + 1L,
                    (PVOID) pini->Fonttr );

                WinSetPresParam(hwnd, PP_FONTNAMESIZE,
                    (LONG)strlen( pini->Fontd ) + 1L,
                    (PVOID) pini->Fontd );

                hab = WinQueryAnchorBlock (hwnd);
                hdc = WinOpenWindowDC (hwnd);
                hps = GpiCreatePS (hab,hdc,&sizel,
                        PU_PELS | GPIF_LONG | GPIA_ASSOC);
                pini->AnzahlFonts = 0;
                cFonts = GpiQueryFonts (hps,
                          QF_PUBLIC,
                          (PSZ) NULL,
                          &pini->AnzahlFonts,
                          sizeof (FONTMETRICS),
                          (PFONTMETRICS) NULL);
                pini->AnzahlFonts = cFonts;
                sprintf ( pini->sprintfb, "Dem System sind %d Fonts bekannt.", pini->AnzahlFonts );
                WriteTrace ( pini, pini->sprintfb );
                rc = DosAllocMem ((PVOID) &pfm,
                         sizeof (FONTMETRICS) * cFonts,
                         PAG_COMMIT | PAG_WRITE );
                if ( rc == 0) 
                        {
                        GpiQueryFonts (hps,
                                 QF_PUBLIC,
                                 (PSZ) NULL,
                                 &pini->AnzahlFonts,
                                 sizeof (FONTMETRICS),
                                 pfm);
                        }
                else
                        {
                        sprintf ( pini->sprintfb, "Fehler w„hrend der Speicherallokation. Rc = %d.", rc );
                        MsgBoxSenden ( pini, pini->sprintfb );
                        }
                sprintf (pini->sprintfb,"Default Fontname : %s", pfm->szFacename);
                WriteTrace(pini, pini->sprintfb);
                break;
            }
            else
                return (MRESULT) TRUE;


        case UM_CONTAINER_FILLED:

            // This message is posted to us by the thread that fills the
            // container with records. This indicates that the container is
            // now filled.

            ContainerFilled( hwnd );

            return 0;


        case WM_ERASEBACKGROUND:

            // Paint the client window in the default color

            return (MRESULT) TRUE;


        case WM_SIZE:

            // Size the activ window with the client window
            hwndFocus = WinQueryFocus ( HWND_DESKTOP );
            WinSetWindowPos( hwndContainer, HWND_TOP, 0, 0,
                           SHORT1FROMMP( mp2 ),
                           SHORT2FROMMP( mp2 ), SWP_SIZE );
            WinSetWindowPos(hwndTrace, HWND_TOP, 0, 0, SHORT1FROMMP( mp2 )-30,
                           SHORT2FROMMP(mp2)-15, SWP_SIZE);

            if ( hwndFocus ==  hwndContainer )
                    {
                   WinShowWindow ( hwndTrace, FALSE );
                   WinShowWindow ( hwndContainer, TRUE );
                    }
            if ( hwndFocus == hwndTrace)
                    {
                   WinShowWindow ( hwndTrace, TRUE );
                   WinShowWindow ( hwndContainer, FALSE );
                    }
            return 0;


        case WM_COMMAND:    // Menu messages

            switch( SHORT1FROMMP( mp1 ) )
            {
                case IDM_TREE:
                    SetContainerView( hwnd, CV_TREE | CV_ICON );
                    return 0;

                case IDM_NAME:
                    SetContainerView( hwnd, CV_NAME | CV_FLOW );
                    return 0;

                case IDM_TEXT:
                    SetContainerView( hwnd, CV_TEXT | CV_FLOW );
                    return 0;

                case IDM_ICON:
                    SetContainerView( hwnd, CV_ICON );
                    return 0;

                case IDM_DETAILS:
                    SetContainerView( hwnd, CV_DETAIL );
                    return 0;
 
                case IDM_Auswahl1:
                   {
/*                   PCHAR     pszFilename;
                   CHAR      sprintfb[200];
                   IPT        start,end;           
                   start = (IPT)WinSendMsg(hwnd, MLFQS_MINSEL,
                              MPFROMSHORT(1), (MPARAM)0);
                   end = (IPT)WinSendMsg(hwnd, MLFQS_MAXSEL,
                              MPFROMSHORT(2), (MPARAM)0);
sprintf ( sprintfb, "MLM_QUERYSEL:  start = %d   -   end = %d", start, end);
WinMessageBox(  HWND_DESKTOP, HWND_DESKTOP, sprintfb,
                           "Koordinaten nach QuerySel", 1, MB_OK | MB_MOVEABLE );
                   WinSendMsg(hwnd,
                          MLM_QUERYSELTEXT,
                          MPFROMLONG(pszFilename),
                          NULL);
WinMessageBox(  HWND_DESKTOP, HWND_DESKTOP, pszFilename,
                           "Filename nach QuerySelText", 1, MB_OK | MB_MOVEABLE );
        */
                   break;
                   }

                case IDM_Trace:
                   {
                   WinShowWindow ( hwndTrace, TRUE );
                   WinShowWindow ( hwndContainer, FALSE );
                   WinSetFocus(HWND_DESKTOP, hwndTrace);
                   break;
                   }

                case IDM_Traceback:
                   {
                   WinShowWindow ( hwndTrace, FALSE );
                   WinShowWindow ( hwndContainer, TRUE );
                   WinSetFocus(HWND_DESKTOP, hwndContainer);
                   break;
                   }

                case IDM_Ende:
                   {
                   WinPostMsg ( hwnd, WM_CLOSE, NULL, NULL );
                   break;
                   }

               /* Modemdaten Dialog   */
                case IDM_Modem:
                   {
                   WinDlgBox (HWND_DESKTOP,
                       hwnd,
                       DialogModem,
                       (HMODULE) 0,
                       ID_ModemDialog,
                       NULL);
                    break;
                    }

                /* Fonts Dialog   */
                case IDM_Fonts:
                    {
                    memset ( &pini->szFontName, 0 , 1 );
                    WinDlgBox (HWND_DESKTOP,
                        hwndClient,
                        DialogFonts,
                        (HMODULE) 0,
                        ID_FontsDlg,
                        pini);

                     if(strlen ( pini->szFontName ) > 3)
                        {
                        sprintf ( pini->sprintfb, "Schrifttype  %s  wurde ausgew„hlt.",
                                              pini->szFontName );
                        WriteTrace ( pini, pini->sprintfb );
                        hwndFocus = WinQueryFocus ( HWND_DESKTOP );
                        WinSetPresParam ( hwndFocus, PP_FONTNAMESIZE,
                                 (LONG)strlen ( pini->szFontName ) + 1L,
                                 (PVOID) pini->szFontName );
                         }
                     else
                         {
                         strcpy ( pini->sprintfb, "Es wurde kein Schrifttyp ausgew„hlt." );
                         WriteTrace ( pini, pini->sprintfb );
                         }
                     break;
                     }
            }

            break;


        case WM_CONTROL:        // These control messages sent by the container

            if( SHORT1FROMMP( mp1 ) == CNR_DIRECTORY )
                switch( SHORT2FROMMP( mp1 ) )
                {
                    case CN_BEGINEDIT:
                        CnrBeginEdit( hwnd, (PCNREDITDATA) mp2 );
                        break;

                    case CN_ENDEDIT:
                        CnrEndEdit( hwnd, (PCNREDITDATA) mp2 );
                        break;
                }

            break;


        case WM_CLOSE:

            // Don't let the WM_QUIT message get posted. *We* will decide
            // when to shut down the message queue.

            UserWantsToClose( hwnd );

            return 0;


        case WM_DESTROY:

            FreeResources( hwnd );

            // If this is the last window open, shut down the message queue
            // which will kill the .EXE. In this program there is only one
            // window so the first WM_DESTROY will always do this.

            if( --iWinCount == 0 )
                (void) WinPostMsg( NULLHANDLE, WM_QUIT, NULL, NULL );

            break;
    }

    return WinDefWindowProc( hwnd, msg, mp1, mp2 );
}

/**********************************************************************/
/*--------------------------- InitClient -----------------------------*/
/*                                                                    */
/*  PROCESS WM_CREATE FOR THE CLIENT WINDOW.                          */
/*                                                                    */
/*  INPUT: client window handle,                                      */
/*         pointer to directory to display in container               */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: TRUE or FALSE if successful or not                        */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static BOOL InitClient( HWND hwndClient, PSZ szDirectory )
{
    CHAR        szFontName[] = "9.Helvetica";
    BOOL      fSuccess = TRUE;
    PINSTANCE pi = (PINSTANCE) malloc( sizeof( INSTANCE ) );

    if( pi )
    {
        (void) memset( pi, 0, sizeof( INSTANCE ) );

        if( WinSetWindowPtr( hwndClient, 0, pi ) )
        {
            // CreateContainer is located in CREATE.C

            HWND hwndCnr = CreateContainer( hwndClient, szDirectory );

            if( hwndCnr )
                {
                // Set the initial container view to Tree/Icon view
                WinSetPresParam(hwndCnr, PP_FONTNAMESIZE,
                    (LONG)strlen( szFontName ) + 1L,
                    (PVOID) szFontName );

                SetContainerView( hwndClient, CV_TEXT | CV_FLOW );
//                SetContainerView( hwndClient, CV_TREE | CV_ICON );
                }
            else
                fSuccess = FALSE;
        }
        else
        {
            fSuccess = FALSE;

            Msg( "InitClient WinSetWindowPtr RC(%X)", HWNDERR( hwndClient ) );
        }
    }
    else
    {
        fSuccess = FALSE;

        Msg( "InitClient out of memory!" );
    }

    return fSuccess;
}

/**********************************************************************/
/*------------------------- SetContainerView -------------------------*/
/*                                                                    */
/*  SET THE TYPE OF VIEW FOR THE CONTAINER                            */
/*                                                                    */
/*  INPUT: client window handle,                                      */
/*         view type to set to                                        */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static VOID SetContainerView( HWND hwndClient, ULONG ulViewType )
{
    PINSTANCE pi = INSTDATA( hwndClient );
    CNRINFO   cnri;

    if( !pi )
    {
        Msg( "Set..View cant get Inst data. RC(%X)", HWNDERR( hwndClient ) );

        return;
    }

    cnri.cb = sizeof( CNRINFO );

    // Set the container window attributes: Set the container view mode. Use a
    // container title. Put a separator between the title and the records
    // beneath it. Make the container title read-only.

    cnri.flWindowAttr = ulViewType | CA_CONTAINERTITLE | CA_TITLESEPARATOR |
                        CA_TITLEREADONLY;

    switch( ulViewType )
    {
        case CV_TREE:
        case (CV_TREE | CV_ICON):

            (void) strcpy( pi->szCnrTitle, "Baum / Icon Ansicht - " );

            // Use default spacing between levels in the tree view. Also use
            // the default width of a line that shows record relationships.

            cnri.cxTreeIndent = -1;
            cnri.cxTreeLine   = -1;

            cnri.flWindowAttr |=  CA_TREELINE;

            break;

        case CV_ICON:

            (void) strcpy( pi->szCnrTitle, "Icon Ansicht - " );

            break;

        case CV_NAME:
        case (CV_NAME | CV_FLOW):

            (void) strcpy( pi->szCnrTitle, "Name / flieáende Ansicht - " );

            break;

        case CV_DETAIL:

            (void) strcpy( pi->szCnrTitle, "Detailansicht - " );

            // If we are in DETAIL view, tell the container that we will be
            // using column headings.

            cnri.flWindowAttr |= CA_DETAILSVIEWTITLES;

            break;

        case CV_TEXT:
        case (CV_TEXT | CV_FLOW):

            (void) strcpy( pi->szCnrTitle, "Text / flieáende Ansicht - " );

            break;
    }

    (void) strcat( pi->szCnrTitle, "Adressdateien" );
//    (void) strcat( pi->szCnrTitle, pi->szDirectory );

    cnri.pszCnrTitle = pi->szCnrTitle;

    // Set the line spacing between rows to be the minimal value so we conserve
    // on container whitespace.

    cnri.cyLineSpacing = 0;

    // Set the container parameters. Note that mp2 specifies which fields of
    // of the CNRINFO structure to use. The CMA_FLWINDOWATTR says to use
    // flWindowAttr to specify which 'Window Attribute' fields to use.

    if( !WinSendDlgItemMsg( hwndClient, CNR_DIRECTORY, CM_SETCNRINFO,
                            MPFROMP( &cnri ),
                            MPFROMLONG( CMA_FLWINDOWATTR | CMA_CNRTITLE |
                                        CMA_LINESPACING ) ) )
        Msg( "SetContainerView CM_SETCNRINFO RC(%X)", HWNDERR( hwndClient ) );

    // The CM_ARRANGE message is applicable only in ICON view. It will arrange
    // the icons according to CUA. Note that this message is unnecessary if
    // the CCS_AUTOPOSITION style is used on the WinCreateWindow call for the
    // container. The problem with using that style is that you have no control
    // over *when* the arranging is done.

    if( ulViewType == CV_ICON )
        if( !WinSendDlgItemMsg( hwndClient, CNR_DIRECTORY, CM_ARRANGE, NULL,
                                NULL ) )
            Msg( "SetContainerView CM_ARRANGE RC(%X)", HWNDERR( hwndClient ) );
}

/**********************************************************************/
/*----------------------- KeepCnrAspectRatio -------------------------*/
/*                                                                    */
/*  KEEP THE CONTAINER FILLING THE CLIENT AREA ON A WM_SIZE MESSAGE.  */
/*                                                                    */
/*  INPUT: client window handle,                                      */
/*         new client window width,                                   */
/*         new client window height                                   */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static VOID KeepCnrAspectRatio( HWND hwndClient, ULONG cxNew, ULONG cyNew )
{
    if( !WinSetWindowPos( WinWindowFromID( hwndClient, CNR_DIRECTORY ),
                          NULLHANDLE, 0, 0, cxNew, cyNew,
                          SWP_MOVE | SWP_SIZE ) )
        Msg( "Keep..Ratio WinSetWindowPos RC(%X)", HWNDERR( hwndClient ) );
}

/**********************************************************************/
/*--------------------------- CnrBeginEdit ---------------------------*/
/*                                                                    */
/*  PROCESS CN_BEGINEDIT NOTIFY MESSAGE.                              */
/*                                                                    */
/*  INPUT: client window handle,                                      */
/*         pointer to the CNREDITDATA structure                       */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static VOID CnrBeginEdit( HWND hwndClient, PCNREDITDATA pced )
{
    PFIELDINFO  pfi = pced->pFieldInfo;
    PINSTANCE   pi = INSTDATA( hwndClient );

    if( !pi )
    {
        Msg( "CnrBeginEdit cant get Inst data. RC(%X)", HWNDERR( hwndClient ) );

        return;
    }

    // pfi only available if details view. If we are in details view and
    // the column the user is direct-editing is the file name field, set the
    // text limit of the MLE to the Maximum that the filename can be.
    // If MLM_SETTEXTLIMIT returns a non-zero value, it means that the text
    // length in the MLE is greater than what we are trying to set it to.

    if( !pfi || pfi->offStruct == FIELDOFFSET( CNRITEM, pszFileName ) )
        if( WinSendDlgItemMsg( WinWindowFromID( hwndClient, CNR_DIRECTORY ),
                        CID_MLE, MLM_SETTEXTLIMIT,
                        MPFROMLONG( GetMaxNameSize( pi->szDirectory[ 0 ] ) ),
                        NULL) )
            Msg( "MLM_SETTEXTLIMIT failed. RC(%X)", HWNDERR( hwndClient ) );
}

/**********************************************************************/
/*-------------------------- GetMaxNameSize --------------------------*/
/*                                                                    */
/*  GET THE MAXIMUM SIZE OF A FILE NAME FOR A DRIVE.                  */
/*                                                                    */
/*  INPUT: drive letter                                               */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: max filename size                                         */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/

#define QFSBUFFSIZE 100

static ULONG GetMaxNameSize( CHAR chDrive )
{
    APIRET      rc;
    CHAR        szDrive[ 3 ], achBuf[ QFSBUFFSIZE ];
    PFSQBUFFER2 pfsqb = (PFSQBUFFER2) achBuf;
    ULONG       cbFileName = 0, cbBuf = sizeof( achBuf );
    PSZ         szFSDName;

    szDrive[ 0 ] = chDrive;
    szDrive[ 1 ] = ':';
    szDrive[ 2 ] = 0;

    // Get the file system type for this drive (i.e. HPFS, FAT, etc.)

    rc = DosQueryFSAttach( szDrive, 0, FSAIL_QUERYNAME, (PFSQBUFFER2) achBuf,
                           &cbBuf );

    // Should probably handle ERROR_BUFFER_OVERFLOW more gracefully, but not
    // in this sample program <g>

    if( rc )
        cbFileName = 12;                     // If any errors, assume FAT
    else
    {
        szFSDName = pfsqb->szName + pfsqb->cbName + 1;

        if( !stricmp( "FAT", szFSDName ) )
            cbFileName = 12;
        else
            cbFileName = CCHMAXPATH;         // If not FAT, assume maximum path
    }

    return cbFileName;
}

/**********************************************************************/
/*---------------------------- CnrEndEdit ----------------------------*/
/*                                                                    */
/*  PROCESS CN_ENDEDIT NOTIFY MESSAGE.                                */
/*                                                                    */
/*  INPUT: client window handle,                                      */
/*         pointer to the CNREDITDATA structure                       */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static VOID CnrEndEdit( HWND hwndClient, PCNREDITDATA pced )
{
    PINSTANCE   pi = INSTDATA( hwndClient );
    PCNRITEM    pci = (PCNRITEM) pced->pRecord;
    PFIELDINFO  pfi = pced->pFieldInfo;
    HWND        hwndCnr, hwndMLE;
    CHAR        szData[ CCHMAXPATH + 1 ];

    if( !pi )
    {
        Msg( "CnrEndEdit cant get Inst data. RC(%X)", HWNDERR( hwndClient ) );

        return;
    }

    hwndCnr = WinWindowFromID( hwndClient, CNR_DIRECTORY );

    // Get the handle to the MLE that the container uses for direct editing

    hwndMLE = WinWindowFromID( hwndCnr, CID_MLE );

    // pfi only available if details view

    if( !pfi || pfi->offStruct == FIELDOFFSET( CNRITEM, pszFileName ) )
    {
        WinQueryWindowText( hwndMLE, sizeof( szData ), szData );

        // Just a cute little test to make sure this is all working...

        if( !stricmp( szData, "BADREC" ) )
            (void) WinAlarm( HWND_DESKTOP, WA_WARNING );
    }

    // Invalidate the container record that was being direct-edited because
    // the text has probably changed. Note that this should only be done if the
    // text changed. Since this is just a sample program we do it regardless...

    if( !WinSendMsg( hwndCnr, CM_INVALIDATERECORD, MPFROMP( &pci ),
                     MPFROM2SHORT( 1, CMA_TEXTCHANGED ) ) )
        Msg( "CnrEndEdit CM_INVALIDATERECORD RC(%X)", HWNDERR( hwndCnr ) );
}

/**********************************************************************/
/*------------------------- ContainerFilled --------------------------*/
/*                                                                    */
/*  THE FILL THREAD HAS COMPLETED.                                    */
/*                                                                    */
/*  INPUT: client window handle                                       */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static VOID ContainerFilled( HWND hwndClient )
{
    PINSTANCE pi = INSTDATA( hwndClient );

    if( !pi )
    {
        Msg( "ContainerFilled cant get Inst data. RC(%X)", HWNDERR(hwndClient));

        return;
    }

    // If the user closed the window while the Fill thread was executing, we
    // want to shut down this window now.

    if( pi->fShutdown )
        WinDestroyWindow( PARENT( hwndClient ) );
    else
    {
        // Set a flag so the window will know the Fill thread has finished

        pi->fContainerFilled = TRUE;

        // Set the titlebar to the program title. We do this because while
        // the container was being filled, the titlebar text was changed
        // to indicate progress.

        SetWindowTitle( hwndClient, PROGRAM_TITLE );
    }
}

/**********************************************************************/
/*------------------------- UserWantsToClose -------------------------*/
/*                                                                    */
/*  PROCESS THE WM_CLOSE MESSAGE.                                     */
/*                                                                    */
/*  INPUT: client window handle                                       */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static VOID UserWantsToClose( HWND hwndClient )
{
    PINSTANCE pi = INSTDATA( hwndClient );

    if( !pi )
    {
        Msg( "UserWantsToClose cant get Inst data. RC(%X)",HWNDERR(hwndClient));

        return;
    }

    // If the Fill thread has completed, destroy the frame window.
    // If the Fill thread has not completed, set a flag that will cause it to
    // terminate, then the destroy will occur under the UM_CONTAINER_FILLED
    // message.

    if( pi->fContainerFilled )
        WinDestroyWindow( PARENT( hwndClient ) );
    else
    {
        // Indicate in the titlebar that the window is in the process of
        // closing.

        SetWindowTitle( hwndClient, "%s: CLOSING...", PROGRAM_TITLE );

        // Set a flag that will tell the Fill thread to shut down

        pi->fShutdown = TRUE;
    }
}

/**********************************************************************/
/*-------------------------- FreeResources ---------------------------*/
/*                                                                    */
/*  FREE PROGRAM RESOURCES.                                           */
/*                                                                    */
/*  INPUT: client window handle                                       */
/*                                                                    */
/*  1.                                                                */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/
static VOID FreeResources( HWND hwndClient )
{
    PINSTANCE pi = INSTDATA( hwndClient );

    if( !pi )
    {
        Msg( "FreeResources cant get Inst data. RC(%X)", HWNDERR( hwndClient ));

        return;
    }

    // Free the memory that was allocated with CM_ALLOCDETAILFIELDINFO. The
    // zero in the first SHORT of mp2 says to free memory for all columns

    if( -1 == (INT) WinSendDlgItemMsg( hwndClient, CNR_DIRECTORY,
                                       CM_REMOVEDETAILFIELDINFO, NULL,
                                       MPFROM2SHORT( 0, CMA_FREE ) ) )
        Msg( "CM_REMOVEDETAILFIELDINFO failed! RC(%X)", HWNDERR( hwndClient ) );

    // Free the memory allocated by the CM_INSERTRECORD messages. The zero
    // in the first SHORT of mp2 says to free memory for all records

    if( -1 == (INT) WinSendDlgItemMsg( hwndClient, CNR_DIRECTORY,
                                       CM_REMOVERECORD, NULL,
                                       MPFROM2SHORT( 0, CMA_FREE ) ) )
        Msg( "CM_REMOVERECORD failed! RC(%X)", HWNDERR( hwndClient ) );

    free( pi );
}

/*********************************************************************
 Modemdaten
**********************************************************************/

MRESULT EXPENTRY DialogModem (HWND hwnd,ULONG msg,MPARAM mp1,MPARAM mp2)
{

switch (msg)
   {
   case WM_INITDLG:
      ChangeColor(hwnd,  184, 180, 100, 20, 20, 250, 250, 0, 0 );
      WinSetDlgItemText (hwnd, ID_ModemCommP, &pini->CommPort[0]);
      WinSetDlgItemText (hwnd, ID_ModemBaudR, &pini->BaudRate[0]);
      WinSetDlgItemText (hwnd, ID_ModemPTWahl, &pini->WahlPT[0]);
      break;

   case WM_COMMAND:
      switch (SHORT1FROMMP (mp1))
      {
         case ID_ModemCancel:

            WinDismissDlg (hwnd,FALSE);
            break;

         case ID_ModemOK:

            WinDismissDlg (hwnd,TRUE);
            break;

      }


      default:
         return WinDefDlgProc (hwnd,msg,mp1,mp2);
         break;
      }

return (MRESULT)FALSE;
}



/*********************************************************************
 Fontsdialog
**********************************************************************/

MRESULT EXPENTRY DialogFonts (HWND hwnd,ULONG msg,MPARAM mp1,MPARAM mp2)
{
        HWND    hwndElement;
        ULONG   Antwort;

        switch (msg)
                {
                case WM_INITDLG:
                        {
                        FillCombobox ( hwnd );
                        ChangeColor ( hwnd, 150, 200, 250, 20, 20, 150, 250, 0, 0 );
                        strcpy ( pini->szFontSize, "8." );
                        break;
                        }

                case WM_COMMAND:
                      switch (SHORT1FROMMP (mp1))
                        {
                        case ID_FontsCancel:
                                {
                                memset(&pini->szFontName[0], 0 , 1 );
                                WinDismissDlg ( hwnd,FALSE );
                                break;
                                }

                        case ID_FontsOkay:
                                {
                                DlgDropDown ( hwnd );
                                WinDismissDlg ( hwnd,TRUE );
                                break;
                                }
                        }

                case WM_CONTROL:
                        {
                        switch( SHORT2FROMMP( mp1 ) )
                                {

                                case BN_CLICKED:        // Button-Nachricht
                                        if ( SHORT1FROMMP (mp1) == ID_Fonts8 )
                                              {
                                              Antwort = WinQueryButtonCheckstate ( hwnd, ID_Fonts8 );
                                              if ( Antwort == 1 )
                                                    strcpy ( pini->szFontSize, "8." );
                                              }
                                        if ( SHORT1FROMMP (mp1) == ID_Fonts9 )
                                              {
                                              Antwort = WinQueryButtonCheckstate ( hwnd, ID_Fonts9 );
                                              if ( Antwort == 1 )
                                                    strcpy ( pini->szFontSize, "9." );
                                              }
                                        if ( SHORT1FROMMP (mp1) == ID_Fonts10 )
                                              {
                                              Antwort = WinQueryButtonCheckstate ( hwnd, ID_Fonts10 );
                                              if ( Antwort == 1)
                                                    strcpy ( pini->szFontSize, "10." );
                                               }
                                        if ( SHORT1FROMMP (mp1) == ID_FontTest )
                                              {
                                                DlgDropDown (  hwnd );
                                                hwndElement = WinWindowFromID ( hwnd, ID_FontTest );
                                                WinSetPresParam ( hwndElement, PP_FONTNAMESIZE,
                                                    (LONG)strlen ( pini->szFontName ) + 1L,
                                                    (PVOID) pini->szFontName );
                                                sprintf ( pini->sprintfb, "Fonttest mit %s", pini->szFontName );
                                                WriteTrace ( pini, pini->sprintfb );
                                                break;
                                              }
                                }
                        }
              default:
                 return WinDefDlgProc ( hwnd, msg, mp1, mp2 );
                 break;
              }
        return (MRESULT)FALSE;
}

VOID FillCombobox ( HWND hwnd )
        {
        HWND    hwndElement;
        SHORT   z = 0;
        PFONTMETRICS   pFontMetrics;
        CHAR    Fontold[40];

        pFontMetrics = pfm;

        /* Eintr„ge in Combobox setzen */
        hwndElement = WinWindowFromID ( hwnd, ID_FontsCombo );
        WinEnableWindowUpdate ( hwndElement, FALSE );

        /* Eintragen der Texte in die ComboBox-Liste */

        while (1)
                {

                if(strcmp ( pFontMetrics->szFacename, Fontold ) != 0)
                        {
                        strcpy ( pini->sprintfb, pFontMetrics->szFacename );
                        WinSendMsg ( hwndElement, LM_INSERTITEM,
                            MPFROMSHORT (LIT_END),
                            MPFROMP ( pini->sprintfb ) );
                        strcpy ( Fontold, pFontMetrics->szFacename );
                        }
                pFontMetrics ++; z ++; if ( z == pini->AnzahlFonts ) break;
                }

        WinShowWindow ( hwndElement, TRUE );
        return;
        }

/*---------------------------------------------------------------------------
Funktion                : Bearbeiten der DropDownBox
---------------------------------------------------------------------------*/
VOID DlgDropDown ( HWND hwndDlg )
{
   HWND hwndElement;
   USHORT index;
   CHAR   szBuffer[50];
 
        hwndElement = WinWindowFromID ( hwndDlg, ID_FontsCombo );
        index = SHORT1FROMMR ( WinSendMsg(hwndElement, LM_QUERYSELECTION,
                        MPFROM2SHORT ( LIT_FIRST, 0 ), 0L ) );
        if ( index != LIT_NONE )
                {
                WinSendMsg ( hwndElement,
                      LM_QUERYITEMTEXT,
                      MPFROM2SHORT ( ( index ),
                      sizeof ( szBuffer ) ),
                      MPFROMP ( &szBuffer[0] ) );
                strcpy ( pini->szFontName, pini->szFontSize );
                strcat ( pini->szFontName, szBuffer );
                }
        else
                memset ( &pini->szFontName, 0, 1 );
        return;
}


/*************************************************************************
 *                     E N D     O F     S O U R C E                     *
 *************************************************************************/
