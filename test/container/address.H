/*********************************************************************
 *                                                                   *
 * MODULE NAME :  address.h              AUTHOR:  Rick Fishman       *
 * DATE WRITTEN:  10-09-92                                           *
 *                                                                   *
 * DESCRIPTION:                                                      *
 *                                                                   *
 *  Common definitions and function prototypes for address.EXE       *
 *                                                                   *
 * HISTORY:                                                          *
 *                                                                   *
 *  10-09-92 - File Created                                          *
 *                                                                   *
 *  Rick Fishman                                                     *
 *  Code Blazers, Inc.                                               *
 *  4113 Apricot                                                     *
 *  Irvine, CA. 92720                                                *
 *  CIS ID: 72251,750                                                *
 *                                                                   *
 *********************************************************************/

/*********************************************************************/
/*------------------- APPLICATION DEFINITIONS -----------------------*/
/*********************************************************************/

#define ID_FIRST_DIRWINDOW  1         // Id of first Directory frame window

#define ID_RESOURCES        1         // Id of frame wnd resources in .RC file

#define CNR_DIRECTORY       30        // The start of our show

#define IDM_ICON            1101      // Menu options
#define IDM_NAME            1102
#define IDM_TREE            1103
#define IDM_DETAILS         1104
#define IDM_TEXT            1105
#define IDM_Trace               WM_USER+2000
#define IDM_Traceclear          WM_USER+2001
#define IDM_Traceback           WM_USER+2002
#define IDM_Ende                WM_USER+2003
#define IDM_Auswahl1            WM_USER+2004
#define IDM_Auswahl2            WM_USER+2005
#define IDM_Auswahl3            WM_USER+2006
#define IDM_Auswahl4            WM_USER+2007
#define IDM_Auswahl6            WM_USER+2008
#define IDM_Auswahl7            WM_USER+2009
#define IDM_Auswahl8            WM_USER+2010
#define IDM_Auswahl9            WM_USER+2011
#define IDM_Modem               WM_USER+2012
#define IDM_Fonts               WM_USER+2013

#define ID_Trace                WM_USER+2050

#define UM_CONTAINER_FILLED WM_USER   // Posted by Fill thread to primary thread

#define DEBUG_FILENAME      "address.dbg"

#define DIRECTORY_WINCLASS  "Adressen Container"

#define PROGRAM_TITLE       "Adressenverwaltung"

#define HABERR( hab )       (ERRORIDERROR( WinGetLastError( hab ) ))

#define ANCHOR( hwnd )      (WinQueryAnchorBlock( hwnd ))

#define HWNDERR( hwnd )      \
            (ERRORIDERROR( WinGetLastError( WinQueryAnchorBlock( hwnd ) ) ))

#define INSTDATA( hwnd )     (WinQueryWindowPtr( hwnd, 0 ))

#define PARENT( hwnd )       (WinQueryWindow( hwnd, QW_PARENT ))

#define GRANDPARENT( hwnd )  (WinQueryWindow( WinQueryWindow(hwnd, QW_PARENT)))

/**********************************************************************/
/*---------------------------- STRUCTURES ----------------------------*/
/**********************************************************************/

typedef struct _CNRITEM               // CONTAINER RECORD STRUCTURE
{
  MINIRECORDCORE rc;                  // Base information
  PSZ            pszFileName;         // Pointer to File name
  HPOINTER       hptrIcon;            // Icon handle
  CDATE          date;                // Date of file
  CTIME          time;                // Time of file
  ULONG          cbFile;              // File size
  CHAR           szFileName[CCHMAXPATH + 1]; // File name
  ULONG          attrFile;            // Attributes of this file

} CNRITEM, *PCNRITEM;

#define EXTRA_RECORD_BYTES (sizeof( CNRITEM ) - sizeof( MINIRECORDCORE ))


typedef struct _INSTANCE              // CONTAINER'S CLIENT WINDOW INSTANCE DATA
{
    BOOL fShutdown;                     // Main thread wants to shut down
    BOOL fContainerFilled;              // Fill thread has completed
    CHAR szCnrTitle[ CCHMAXPATH + 20 ]; // Container title
    CHAR szDirectory[ CCHMAXPATH + 1 ]; // Directory being displayed

} INSTANCE, *PINSTANCE;


typedef struct _THREADPARMS          // PARAMETERS TO PASS TO SECONDARY THREAD
{
    HWND hwndClient;                 // public

} THREADPARMS, *PTHREADPARMS;


typedef struct _INIDATA     // Working Storage - adressiert Åber pini, der mitgegeben wird
{
        HWND hwndOwner;                   // Handle des Standardwindows
        HWND hwndMsg1;                     // Handle des Msg1windows
        HWND hwndMsg2;                     // Handle des Msg2windows
        CHAR szIniFile[ CCHMAXPATH ];               // Name Ini-Datei gefÅllt
        CHAR MainDir[CCHMAXPATH ];        // Directory der Adre·dateien - returned
        CHAR CommPort[5];                    // Modem Communication Port - returned
        CHAR BaudRate[6];                    // öbertragungsrate des Modems - returned
        USHORT usBPS;                        // in hex
        CHAR WahlPT[2];                      // Puls- oder Tonwahl           - returned
        CHAR Fontfr[30];                      // font for frame                  - returned
        CHAR Fontco[30];                      // font Container                 - returned
        CHAR Fonttr[30];                     // font for trace window           - returned
        CHAR Fontd[30];                      // font for data                    - returned
        CHAR sprintfb[255];                  // Arbeitsbereich - von Allen benÅtzt - Msg
        CHAR Filename[CCHMAXPATH];       //  Lesen
        LONG AnzahlFonts;                     //  GpiQueryFonts
        CHAR szFontSize[4];                  //  Fontdialog
        CHAR szFontName[100];               //  Fontdialog
} INIDATA, *PINIDATA;
PINIDATA        pini;                         // Working Storage

/**********************************************************************/
/*----------------------- FUNCTION PROTOTYPES ------------------------*/
/**********************************************************************/

// In common.c

VOID SetWindowTitle( HWND hwndClient, PSZ szFormat, ... );
VOID Msg( PSZ szFormat, ... );
VOID WriteTrace ( PINIDATA pini, CHAR Msg [ 255 ] );
USHORT MsgBoxSenden( PINIDATA pini, CHAR Msg [255] );
VOID ChangeColor(HWND hwnd, BYTE ared, BYTE agreen, BYTE ablue,
   BYTE bred, BYTE bgreen, BYTE bblue,
   BYTE cred, BYTE cgreen, BYTE cblue);

// In create.c

HWND CreateDirectoryWin( PSZ szDirectory );
HWND CreateContainer( HWND hwndClient, PSZ szDirectory );
VOID  CreateTrace( PINIDATA pini );
BOOL  ReadIni  ( PINIDATA pini);

// In populate.c

VOID PopulateContainer( PVOID pThreadParms );

/**********************************************************************/
/*------------------------ GLOBAL VARIABLES --------------------------*/
/**********************************************************************/

#ifdef GLOBALS_DEFINED
#  define DATADEF
#else
#  define DATADEF extern
#endif

HWND        hwndFrame, hwndClient = NULLHANDLE;
HWND hwndContainer, hwndTrace;
PFONTMETRICS   pfm;             // Gpi Fonts

DATADEF INT iWinCount;                  // Number of directory windows created

/***********************************************************************
 *                   E N D     O F     S O U R C E                     *
 **********************************************************************/
