#define INCL_BASE
#define INCL_PM
#include <os2.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <time.h>
#include <sys\types.h>
#include <sys\timeb.h>

#include "defines.h"
#include "mastermind.h"

#define VERSION   1
#define REVISION  4

/* globale Variablen */
HAB  hab;                  /* Anchorblock fÅr Prozess */
int screenx=0,screeny=0;   /* groesse des Bildschirms */
int iActualRow;            /* aktuelle Reihe beim Raten der Farben */
int MasterColors[4];       /* zu ratende Farben */
int guessed;               /* Flag: Farben erraten? */
int NumTries;              /* Anzahl von geratenen Farben */
int GuessedColors[40];     /* geratene Farben */
int Pins[40];              /* zu den Farben gehîrige Pins */
HWND hwndButton=0L;        /* Knopf zum öbernehmen einer Zeile */
HWND hwndHelpInstance=0L;  /* Hilfe-Instanz */
// HPOINTER hptrRed, hptrGreen, hptrBlue, hptrYellow, hptrCyan, hptrPink; /* Handles fÅr Mauszeiger */
HPOINTER hptrDefault;      /* Standardmauszeiger */
int iDragColor;            /* Farbe, die gezogen wird */
int Playing=FALSE;         /* Spiel lÑuft */
int Paused=FALSE;          /* Spielpause eingelegt */
int dragging;              /* wird gerade gezogen? */
LONG seconds;              /* Timer */
int circle=0;              /* welcher Kreis soll markiert werden */
int Multiple=TRUE;         /* Farben mehrmals verwenden */
int AboutAtStart=TRUE;     /* wird der About Dialog zum Start angezeigt? */
int HelpEnabled=FALSE;     /* ist die Hilfe vorhanden? */
HMODULE hmodDLLNational=NULLHANDLE;/* Module Handle der DLL fÅr NLV */
HMODULE hmodDLLGlobal=NULLHANDLE;/* Module Handle der DLL fÅr globale Ressourcen */
char resourceText[650];    /* Text loaded from resource dll */
DllList *dllList=NULL;     /* list with language dlls */
char *Language=NULL;       /* selected language */
int  ColorsForUse[6];      /* vom Benutzer ausgewÑhlte Farben */
HPOINTER PointersForUse[6];    /* mit den Farben korrespondierende Mauszeiger */


int main(VOID)
/******************************************************/
/* Hauptfunktion des Programms:                       */
/*                                                    */
/* Fensterklasse registrieren, Fenster îffen +        */
/* positionieren                                      */
/******************************************************/
{
   HWND hwndRahmen=0L;         /* Handle des Hauptfensters */
   HWND hwndAnwendung=0L;      /* Handle des Hauptfensters */
   HWND hwndAbout=0L;          /* Handle des About-Dialogs */
   HWND hwndMenu=0L;           /* Handle der MenÅleiste */
   HMQ  hmq;
   QMSG qmsg;
   ULONG fensterstil;
   ULONG idTimer;
   PSZ  ModuleName;                      /* Name der DLL */
   UCHAR LoadError[256] = "";            /* Bereich fÅr Ladefehlerinformation */
   UCHAR errmsg[500] = "";               /* Bereich fÅr Ladefehlerinformation */
   APIRET rc;                            /* RÅckgabewert der Funktion */
   char ver[2+1], rev[2+1];              /* Versions und Subversionsinformationen */
   UCHAR achDirName[256] = "";           /* Buffer for name of directory */
   ULONG cbDirPathLen = 0;               /* size of buffer for directory name */
   ULONG DriveNum = 0;
   ULONG DriveMap = 0;
   UCHAR achGlobalDll[50+256] = "";      /* Name and full path to global.dll */


   /* Proze· initialisieren */
   hab = WinInitialize(0);
   hmq = WinCreateMsgQueue(hab,0);

   /* Starteinstellungen treffen */
   init();
   ReadSettings();
   if(!GetLanguageDlls())
      error("Could not find any dll. Program will stop", TRUE);

   /* DLLs laden */
   /* get current drive */
   DosQueryCurrentDisk(&DriveNum, &DriveMap);
   sprintf(achGlobalDll, "%c:\\", 'A' + DriveNum - 1);
   /* get current directory */
   cbDirPathLen = (ULONG) sizeof(achDirName);
   DosQueryCurrentDir(0, achDirName, &cbDirPathLen);
   strcat(achGlobalDll, achDirName);
   strcat(achGlobalDll, "\\global.dll");
   //error(achGlobalDll, FALSE);
   /* use full path to dll */
   ModuleName = malloc(strlen(achGlobalDll)+2);
   strcpy(ModuleName, achGlobalDll);
   //error(ModuleName, FALSE);
   rc = DosLoadModule(LoadError,
                 sizeof(LoadError),
                 ModuleName,
                 &hmodDLLGlobal);
   if(rc != NO_ERROR) {
      sprintf(errmsg, "The file %s was not found! If you do not have it, please obtain it from the Mastermind/2 homepage at http://www.geocities.com/SiliconValley/Port/4718/ by downloading one of the national packages. Mastermind/2 will not run without this file. The errormessage returned by OS/2 was: \"%s\"", ModuleName, LoadError);
      error(errmsg, TRUE);
      }
   free(ModuleName);
   ModuleName = NULL;
   ModuleName = GetModuleName();
   rc = DosLoadModule(LoadError,
                 sizeof(LoadError),
                 ModuleName,
                 &hmodDLLNational);
   if(rc != NO_ERROR) {
      sprintf(errmsg, "The file %s was not found! If you do not have it, please obtain it from the Mastermind/2 homepage at http://www.geocities.com/SiliconValley/Port/4718/ by downloading one of the national packages. Mastermind/2 will not run without this file. The errormessage returned by OS/2 was: \"%s\"", ModuleName, LoadError);
      error(errmsg, TRUE);
      }
   if (ModuleName) {
      free(ModuleName);
      ModuleName = NULL;
      }

   /* About-Dialog */
   hwndAbout = WinLoadDlg( HWND_DESKTOP,    /* Place anywhere on desktop    */
                       HWND_DESKTOP,        /* Owned by desk top            */
                       (PFNWP)ProdInfoDlgProc,   /* Addr. of procedure  */
                       hmodDLLNational,         /* Module handle                */
                       DLG_ABOUT,       /* Dialog identifier in resource*/
                       NULL);           /* Initialization data          */
   WinSetWindowPos(hwndAbout, HWND_TOP,
                    (WinQuerySysValue(HWND_DESKTOP, SV_CXSCREEN)-390)/2,
                    (WinQuerySysValue(HWND_DESKTOP, SV_CYSCREEN)-330)/2,
                    366, 330,
                    SWP_SIZE | SWP_MOVE | SWP_ACTIVATE | SWP_SHOW);
   idTimer = WinStartTimer(hab, hwndAbout, 43, 7500);
   WinProcessDlg(hwndAbout);
   WinDestroyWindow(hwndAbout);
   WinStopTimer(hab, hwndAbout, idTimer);
   AboutAtStart = FALSE;

   /* Hauptfenster */
   WinRegisterClass( hab,(PSZ)"Fenster",(PFNWP)Fensterhauptfunktion,
                     CS_SIZEREDRAW, 0 );

   fensterstil = FCF_TITLEBAR      | FCF_SYSMENU | FCF_MINBUTTON | FCF_MENU | FCF_ACCELTABLE |
                 FCF_SHELLPOSITION | FCF_DLGBORDER | FCF_TASKLIST | FCF_ICON;

   if (!WinLoadString(hab, hmodDLLGlobal, IDS_VERSION, sizeof(ver), ver))
      error("Could not load version information. Program will end.", TRUE);
   if (!WinLoadString(hab, hmodDLLGlobal, IDS_REVISION, sizeof(rev), rev))
      error("Could not load sub-version information. Program will end.", TRUE);
   if((VERSION != atoi(ver)) || (REVISION != atoi(rev))) {
      sprintf(errmsg, "You have got the wrong file global.dll (v %s.%s). It should be v %d.%d. You can obtain the newset versions from the Mastermind/2 homepage at http://www.geocities.com/SiliconValley/Port/4718/. The program will end now.", ver, rev, VERSION, REVISION);
      error(errmsg, TRUE);
      }
   else
      sprintf(resourceText, "Mastermind/2  -  v %s.%sa",ver,rev);

   hwndRahmen = WinCreateStdWindow(
                  HWND_DESKTOP,
                 0L,
                 &fensterstil,
                 "Fenster",
                 resourceText,
                 0,
                 hmodDLLNational,
                 ID_MAIN,
                 &hwndAnwendung );
   if(!hwndRahmen)
      error("Could not create window. Program will end. Please contact the author.", TRUE);

   WinSetWindowPos(hwndRahmen, HWND_TOP,
                    (WinQuerySysValue(HWND_DESKTOP, SV_CXSCREEN)-INITIALWIDTH)/2,
                    (WinQuerySysValue(HWND_DESKTOP, SV_CYSCREEN)-INITIALHEIGHT)/2,
                    INITIALWIDTH, INITIALHEIGHT,
                    SWP_SIZE | SWP_MOVE | SWP_ACTIVATE | SWP_SHOW);

   if (!WinLoadString(hab, hmodDLLNational, IDS_STARTNEWGAME, sizeof(resourceText), resourceText))
      error("Could not load text for button. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", TRUE);

   hwndButton = WinCreateWindow(hwndAnwendung,
                                WC_BUTTON,
                                resourceText,
                                WS_VISIBLE |
                                BS_PUSHBUTTON | BS_DEFAULT,
                                284, 25,
                                150, 36,
                                hwndAnwendung,
                                HWND_TOP,
                                IDPB_TAKEOVER,
                                NULL,
                                NULL);

   /* MenÅitem "Multiple" richtig einstellen deselektieren */
   hwndMenu = WinWindowFromID(hwndRahmen, FID_MENU);
   WinCheckMenuItem(hwndMenu, IDM_MULTIPLE, Multiple);

   idTimer = WinStartTimer(hab, hwndAnwendung, 42, 1000);
   if (idTimer == 0)
      {
      if (!WinLoadString(hab, hmodDLLNational, IDS_TIMERERROR, sizeof(resourceText), resourceText))
         error("Could not load errormessage. Program will end.", TRUE);
      error(resourceText, TRUE);
      }

   /* Hilfe mit Programm verbinden */
   InitHelp(hwndAnwendung);

   /* SystemmenÅ anpassen */
   SetSystemMenu(hwndRahmen);

   /* Menu "Language" anpassen */
   SetLanguageMenu(hwndMenu);

   while(WinGetMsg(hab,&qmsg,0L,0,0)) WinDispatchMsg(hab, &qmsg);

   rc = DosFreeModule(hmodDLLNational);
   rc = DosFreeModule(hmodDLLGlobal);
   DestroyHelpInstance();
   clearup();
   WinDestroyWindow(hwndRahmen);
   WinDestroyMsgQueue(hmq);
   WinTerminate(hab);

   exit;
}


MRESULT EXPENTRY Fensterhauptfunktion(HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
/******************************************************/
/* Abarbeitung der Messagequeue                       */
/******************************************************/
{
   RECTL rcl;
   HPS   hps;
   int   i,j;
   LONG  lHits, lHRound, lVRound, lControl;
//   POINTL ptlStart, ptlEdge;
   POINTL ptlDrawPosition;
   char  cNumber[4];
   POINTS ptsPointerPos;
//   DRAGIMAGE dimg;
//   PDRAGINFO pDinfo;
//   PDRAGITEM pDitem;
//   DRAGITEM ditem;
/*   RECTL rect;*/
   ULONG rc;
   ARCPARAMS arcp={1,1,0,0};
   char title[30];
   int stop;
   static short dragStartPos=-1;  /* -1, wenn nicht aus oberem Feld gezogen wurde, 0-3 fÅr Stelle aus oberem Feld */

  switch(msg)
  {
    case WM_PAINT  : hps = WinBeginPaint(hwnd,
                           NULLHANDLE,
                           &rcl);

                     WinFillRect(hps, &rcl, CLR_PALEGRAY);

                     /* Spielfeld aufbauen */
                     /* Box fÅr Rateversuche */
                     Draw3DBox(hps, 50, 90, 168, 320, CLR_DARKGRAY, MSTM_FILL);
                     /* Box fÅr Farbauswahl */
                     Draw3DBox(hps, 50, 25, 168, 36, CLR_DARKGRAY, MSTM_FILL);
                     /* Box fÅr zu ratende Farben */
                     Draw3DBox(hps, 50, 440, 168, 36, CLR_DARKGRAY, MSTM_FILL);
                     /* VerfÅgbare Farben darstellen */
                     if (Playing == TRUE)
                        for (i=0; i<=5; i++)
                            DrawBitmap(hps, ColorsForUse[i], 16L, 19L, 57+i*27, 35);
                     else
                        {
                        ptlDrawPosition.x = 57;
                        ptlDrawPosition.y = 40;
                        GpiSetCurrentPosition(hps, &ptlDrawPosition);
                        if (!WinLoadString(hab, hmodDLLNational, IDS_NOTSTARTED, sizeof(resourceText), resourceText))
                           error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                        GpiCharString(hps, strlen(resourceText), resourceText);
                        }
                     /* Markierungen zum Fallenlassen in Box fÅr Rateversuche zeichnen */
                     if (Paused == FALSE) {
                        DrawActualMarks(hps, TRUE);
                        DrawFutureMarks(hps);
                     }
                     /* Zahlen bis zum aktuellen Versuch neben das Feld schreiben */
                     DrawRowNumbers(hps);
                     /* allgemeine Beschriftungen machen */
                     ptlDrawPosition.x = 50;
                     ptlDrawPosition.y = 485;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLLNational, IDS_GUESS, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     GpiCharString(hps, strlen(resourceText), resourceText);
                     ptlDrawPosition.y = 70;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLLNational, IDS_AVAILABLE, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     GpiCharString(hps, strlen(resourceText), resourceText);
                     ptlDrawPosition.y = 419;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLLNational, IDS_DROPHERE, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     GpiCharString(hps, strlen(resourceText), resourceText);
                     ptlDrawPosition.x = 230;
                     ptlDrawPosition.y = 485;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLLNational, IDS_RIGHTCOLOR, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     GpiCharString(hps, strlen(resourceText), resourceText);
                     ptlDrawPosition.x = 350;
                     ptlDrawPosition.y = 485;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     GpiCharString(hps, strlen(resourceText), resourceText);
                     ptlDrawPosition.y = 467;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLLNational, IDS_RIGHTPLACE, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     GpiCharString(hps, strlen(resourceText), resourceText);
                     ptlDrawPosition.x = 230;
                     ptlDrawPosition.y = 467;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLLNational, IDS_WRONGPLACE, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     GpiCharString(hps, strlen(resourceText), resourceText);

                     /* Falls Farben erraten wurden, Originalfarben einzeichnen */
                     if (guessed==TRUE)
                        DrawMasterColors(hps);

                     /* alle geratenen Farben einzeichnen */
                     /* Anzeige nur machen, wenn Spiel gerade nicht im Pause-Modus */
                     if (Paused == FALSE)
                        {
                        DrawGuessedColors(hps);
                        DrawPins(hps);
                        }
                     /* sonst nicht anzeigen */
                     else
                        {
                        GpiSetColor(hps, CLR_DARKBLUE);
                        ptlDrawPosition.x = 87;
                        ptlDrawPosition.y = 250;
                        GpiSetCurrentPosition(hps, &ptlDrawPosition);
                        if (!WinLoadString(hab, hmodDLLNational, IDS_GAMEPAUSED, sizeof(resourceText), resourceText))
                           error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                        GpiCharString(hps, strlen(resourceText), resourceText);
                        }

                     /* Timer anzeigen */
                     DrawTime(hps);

                     WinEndPaint(hps);
                     return (FALSE);
                     break;

    case WM_CREATE:
                     /* Schriftart festlegen */
                     WinSetPresParam(hwnd, PP_FONTNAMESIZE, (ULONG)sizeof("8.Helv"), (PVOID)"8.Helv");
                     /* Mauszeiger laden */
                     for (i=0; i<6; i++)
                        PointersForUse[i] = WinLoadPointer(HWND_DESKTOP, hmodDLLGlobal, ColorsForUse[i]+COLOR_TO_POINTER_OFFSET);
                     /* Hilfe mit Programm verbinden */
//                     InitHelp(hwnd);
                     break;
    case WM_DESTROY:
                     /* Mauszeiger lîschen */
                     for (i=0; i<6; i++)
                        WinDestroyPointer(PointersForUse[i]);
                     break;
    case WM_MOUSEMOVE:
                     /* Mauszeiger setzen */
                     if (dragging == TRUE)
                        {
                        /* Koordinaten feststellen */
                        ptsPointerPos.x = SHORT1FROMMP(mp1);
                        ptsPointerPos.y = SHORT2FROMMP(mp1);
                        /* falls getroffen: Markierung zeichnen */
                        if ((ptsPointerPos.y >= 90+17+(iActualRow*30)) && (ptsPointerPos.y <= 90+17+16+(iActualRow*30)))
                           {
                           if ((ptsPointerPos.x >= 68) && (ptsPointerPos.x <= 87)) {
                              if (circle != 1)
                                 {
                                 circle = 1;
                                 hps = WinGetPS(hwnd);
                                 ptlDrawPosition.x = 50 + 18 + 9;
                                 ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                                 GpiSetCurrentPosition(hps, &ptlDrawPosition);
                                 GpiSetMix(hps, FM_INVERT);
                                 GpiFullArc(hps, DRO_OUTLINE, MakeFixed(DROPMARKRADIUS,0));
                                 WinReleasePS(hps);
                                 } /* circle != 1 */
                              } /* ptsPointerPos.x... */
                           else
                              if ((ptsPointerPos.x >= 114) && (ptsPointerPos.x <= 133)) {
                                 if (circle != 2)
                                    {
                                    circle = 2;
                                    hps = WinGetPS(hwnd);
                                    ptlDrawPosition.x = 50 + 18 + 9 + 37;
                                    ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                                    GpiSetCurrentPosition(hps, &ptlDrawPosition);
                                    GpiSetMix(hps, FM_INVERT);
                                    GpiFullArc(hps, DRO_OUTLINE, MakeFixed(DROPMARKRADIUS,0));
                                    WinReleasePS(hps);
                                    } /* circle != 2 */
                                 } /* ptsPointerPos.x... */
                              else
                                 if ((ptsPointerPos.x >= 151) && (ptsPointerPos.x <= 170)) {
                                    if (circle != 3)
                                       {
                                       circle = 3;
                                       hps = WinGetPS(hwnd);
                                       ptlDrawPosition.x = 50 + 18 + 9 + 2*37;
                                       ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                                       GpiSetCurrentPosition(hps, &ptlDrawPosition);
                                       GpiSetMix(hps, FM_INVERT);
                                       GpiFullArc(hps, DRO_OUTLINE, MakeFixed(DROPMARKRADIUS,0));
                                       WinReleasePS(hps);
                                       }
                                    }
                                 else
                                    if ((ptsPointerPos.x >= 188) && (ptsPointerPos.x <= 207)) {
                                       if (circle != 4)
                                          {
                                          circle = 4;
                                          hps = WinGetPS(hwnd);
                                          ptlDrawPosition.x = 50 + 18 + 9 + 3*37;
                                          ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                                          GpiSetCurrentPosition(hps, &ptlDrawPosition);
                                          GpiSetMix(hps, FM_INVERT);
                                          GpiFullArc(hps, DRO_OUTLINE, MakeFixed(DROPMARKRADIUS,0));
                                          WinReleasePS(hps);
                                          }
                                       }
                                    else
                                       if (circle != 0)
                                          {
                                          hps = WinGetPS(hwnd);
                                          ptlDrawPosition.x = 50 + 18 + 9 + (circle-1)*37;
                                          ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                                          GpiSetCurrentPosition(hps, &ptlDrawPosition);
                                          GpiSetMix(hps, FM_INVERT);
                                          GpiFullArc(hps, DRO_OUTLINE, MakeFixed(DROPMARKRADIUS,0));
                                          WinReleasePS(hps);
                                          circle = 0;
                                          }
                           }
                        else
                           if (circle != 0)
                              {
                              hps = WinGetPS(hwnd);
                              ptlDrawPosition.x = 50 + 18 + 9 + (circle-1)*37;
                              ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                              GpiSetCurrentPosition(hps, &ptlDrawPosition);
                              GpiSetMix(hps, FM_INVERT);
                              GpiFullArc(hps, DRO_OUTLINE, MakeFixed(DROPMARKRADIUS,0));
                              WinReleasePS(hps);
                              circle = 0;
                              }

/*                        switch (iDragColor)
                           {
                           case IDB_RED: WinSetPointer(HWND_DESKTOP, hptrRed);
                              return 0;
                              break;
                           case IDB_GREEN: WinSetPointer(HWND_DESKTOP, hptrGreen);
                              return 0;
                              break;
                           case IDB_BLUE: WinSetPointer(HWND_DESKTOP, hptrBlue);
                              return 0;
                              break;
                           case IDB_YELLOW: WinSetPointer(HWND_DESKTOP, hptrYellow);
                              return 0;
                              break;
                           case IDB_CYAN: WinSetPointer(HWND_DESKTOP, hptrCyan);
                              return 0;
                              break;
                           case IDB_PINK: WinSetPointer(HWND_DESKTOP, hptrPink);
                              return 0;
                              break;
                           default:
                              break;
                           }
*/
                        WinSetPointer(HWND_DESKTOP, PointersForUse[iDragColor]);
                        return 0;
                        }
                     break;
    case WM_ENDDRAG:
                     /* Flag zurÅcksetzen */
                     dragging = FALSE;
                     /* alten Mauszeiger wiederherstellen */
                     WinSetPointer(HWND_DESKTOP, hptrDefault);
                     /* Koordinaten feststellen */
                     ptsPointerPos.x = SHORT1FROMMP(mp1);
                     ptsPointerPos.y = SHORT2FROMMP(mp1);
                     /* Drop-Markierung entfernen */
                     if (circle != 0) {
                        hps = WinGetPS(hwnd);
                        ptlDrawPosition.x = 50 + 18 + 9 + (circle-1)*37;
                        ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                        GpiSetCurrentPosition(hps, &ptlDrawPosition);
                        GpiSetMix(hps, FM_INVERT);
                        GpiFullArc(hps, DRO_OUTLINE, MakeFixed(DROPMARKRADIUS,0));
                        WinReleasePS(hps);
                        circle = 0;
                        }

                     /* falls getroffen: Farbe zuordnen */
                     if ((ptsPointerPos.y >= 90+17+(iActualRow*30)) && (ptsPointerPos.y <= 90+17+16+(iActualRow*30)))
                        {
                        if ((ptsPointerPos.x >= 68) && (ptsPointerPos.x <= 87) && (dragStartPos != 0))
                           {
                           if (NumTries <= 4*iActualRow)
                              NumTries = 4*iActualRow;
                           GuessedColors[4*iActualRow]=iDragColor;
                           hps = WinGetPS(hwnd);
                           DrawColors(hps, ColorsForUse[iDragColor], 0, iActualRow);
                           if (dragStartPos != -1)
                              {
                              /* nun Farbe auch im Speicher lîschen */
                              GuessedColors[(4*iActualRow)+dragStartPos] = -1;
                              /* falls der verschobene Pin der am weitesten rechte war, Markierung auf den nun am weitesten rechten setzen */
                              if (NumTries == (4*iActualRow)+dragStartPos)
                                 {
                                 i = dragStartPos;
                                 while (i>=0 && GuessedColors[i+(4*iActualRow)]==-1)
                                    i--;
                                 /* i jetzt Spalte mit letzem Pin */
                                 NumTries = (4*iActualRow) + i;
                                 }
                              dragStartPos = -1;
                              }
                           if (Multiple == FALSE)
                              clearDoubleColor(hps, (short)0);
                           WinReleasePS(hps);
                           }
                        else
                           if ((ptsPointerPos.x >= 114) && (ptsPointerPos.x <= 133) && (dragStartPos != 1))
                              {
                              if (NumTries <= (4*iActualRow)+1)
                                 NumTries = (4*iActualRow)+1;
                              GuessedColors[(4*iActualRow)+1]=iDragColor;
                              hps = WinGetPS(hwnd);
                              DrawColors(hps, ColorsForUse[iDragColor], 1, iActualRow);
                              if (dragStartPos != -1)
                                 {
                                 /* nun Farbe auch im Speicher lîschen */
                                 GuessedColors[(4*iActualRow)+dragStartPos] = -1;
                                 /* falls der verschobene Pin der am weitesten rechte war, Markierung auf den nun am weitesten rechten setzen */
                                 if (NumTries == (4*iActualRow)+dragStartPos)
                                    {
                                    i = dragStartPos;
                                    while (i>=0 && GuessedColors[i+(4*iActualRow)]==-1)
                                       i--;
                                    /* i jetzt Spalte mit letzem Pin */
                                    NumTries = (4*iActualRow) + i;
                                    }
                                 dragStartPos = -1;
                                 }
                              if (Multiple == FALSE)
                                 clearDoubleColor(hps, (short)1);
                              WinReleasePS(hps);
                              }
                           else
                              if ((ptsPointerPos.x >= 151) && (ptsPointerPos.x <= 170) && (dragStartPos != 2))
                                 {
                                 if (NumTries <= (4*iActualRow)+2)
                                    NumTries = (4*iActualRow)+2;
                                 GuessedColors[(4*iActualRow)+2]=iDragColor;
                                 hps = WinGetPS(hwnd);
                                 DrawColors(hps, ColorsForUse[iDragColor], 2, iActualRow);
                                 if (dragStartPos != -1)
                                    {
                                    /* nun Farbe auch im Speicher lîschen */
                                    GuessedColors[(4*iActualRow)+dragStartPos] = -1;
                                    /* falls der verschobene Pin der am weitesten rechte war, Markierung auf den nun am weitesten rechten setzen */
                                    if (NumTries == (4*iActualRow)+dragStartPos)
                                       {
                                       i = dragStartPos;
                                       while (i>=0 && GuessedColors[i+(4*iActualRow)]==-1)
                                          i--;
                                       /* i jetzt Spalte mit letzem Pin */
                                       NumTries = (4*iActualRow) + i;
                                       }
                                    dragStartPos = -1;
                                    }
                                 if (Multiple == FALSE)
                                    clearDoubleColor(hps, (short)2);
                                 WinReleasePS(hps);
                                 }
                              else
                                 if ((ptsPointerPos.x >= 188) && (ptsPointerPos.x <= 207) && (dragStartPos != 3))
                                    {
                                    if (NumTries <= (4*iActualRow)+3)
                                       NumTries = (4*iActualRow)+3;
                                    GuessedColors[(4*iActualRow)+3]=iDragColor;
                                    hps = WinGetPS(hwnd);
                                    DrawColors(hps, ColorsForUse[iDragColor], 3, iActualRow);
                                    if (dragStartPos != -1)
                                       {
                                       /* nun Farbe auch im Speicher lîschen */
                                       GuessedColors[(4*iActualRow)+dragStartPos] = -1;
                                       /* falls der verschobene Pin der am weitesten rechte war, Markierung auf den nun am weitesten rechten setzen */
                                       if (NumTries == (4*iActualRow)+dragStartPos)
                                          {
                                          i = dragStartPos;
                                          while (i>=0 && GuessedColors[i+(4*iActualRow)]==-1)
                                             i--;
                                          /* i jetzt Spalte mit letzem Pin */
                                          NumTries = (4*iActualRow) + i;
                                          }
                                       dragStartPos = -1;
                                       }
                                    if (Multiple == FALSE)
                                       clearDoubleColor(hps, (short)3);
                                    WinReleasePS(hps);
                                    }
                                 else /* y stimmt zwar, aber bei x nicht getroffen */
                                    {
                                    if (dragStartPos != -1)
                                       {
                                       hps = WinGetPS(hwnd);
                                       DrawColors(hps, ColorsForUse[iDragColor], dragStartPos, iActualRow);
                                       WinReleasePS(hps);
                                       }
                                    }
                        }
                     else /* y nicht getroffen */
                        {
                        if (dragStartPos != -1)
                           {
                           hps = WinGetPS(hwnd);
                           DrawColors(hps, ColorsForUse[iDragColor], dragStartPos, iActualRow);
                           WinReleasePS(hps);
                           }
                        }
                     /* gemerkte Farbe und drag-Position zurÅcksetzen */
                     iDragColor = -1;
                     dragStartPos = -1;
                     /* wenn alle Farben der aktuellen Reihe voll sind Knopf aktivieren */
                     if ((GuessedColors[4*iActualRow] != -1) && (GuessedColors[(4*iActualRow)+1] != -1) && (GuessedColors[(4*iActualRow)+2] != -1) && (GuessedColors[(4*iActualRow)+3] != -1)) {
                        rc = WinEnableWindow(hwndButton, TRUE);
/*                        if (rc != TRUE) {
                           error("Could not enable button!", FALSE);
                           } */
                        }
                     else
                        {
                        rc = WinEnableWindow(hwndButton, FALSE);
/*                        if (rc != TRUE) {
                           error("Could not disable button!", FALSE);
                           } */
                        }
                     break;
    case WM_BEGINDRAG:
                  if ((Playing == TRUE) && (Paused == FALSE))
                     {
                     /* Drag hat begonnen */
                     if (dragging == FALSE)
                        {
                        ptsPointerPos.x = SHORT1FROMMP(mp1);
                        ptsPointerPos.y = SHORT2FROMMP(mp1);
                        iDragColor = -1;
                        dragStartPos = -1;
                        /* pa·t die y-Koordinate? */
                        if ((ptsPointerPos.y >= 35) && (ptsPointerPos.y <= 51)) {
                           /* Farbe feststellen */
                           if ((ptsPointerPos.x >= 57) && (ptsPointerPos.x <= 78))
                              {
                              dragging = TRUE;
                              iDragColor = 0;
                              }
                              else
                                 if ((ptsPointerPos.x >= 84) && (ptsPointerPos.x <= 103))
                                    {
                                    dragging = TRUE;
                                    iDragColor = 1;
                                    }
                                    else
                                       if ((ptsPointerPos.x >= 111) && (ptsPointerPos.x <= 130))
                                          {
                                          dragging = TRUE;
                                          iDragColor = 2;
                                          }
                                          else
                                             if ((ptsPointerPos.x >= 138) && (ptsPointerPos.x <= 157))
                                                {
                                                dragging = TRUE;
                                                iDragColor = 3;
                                                }
                                                else
                                                   if ((ptsPointerPos.x >= 165) && (ptsPointerPos.x <= 184))
                                                      {
                                                      dragging = TRUE;
                                                      iDragColor = 4;
                                                      }
                                                      else
                                                         if ((ptsPointerPos.x >= 192) && (ptsPointerPos.x <= 211))
                                                            {
                                                            dragging = TRUE;
                                                            iDragColor = 5;
                                                            }
                           } /* endif ptspointerpos.y */
                        else {  /* y ist nicht im Feld der verfÅgbaren Farben */
                           if ((ptsPointerPos.y >= 90+17+(iActualRow*30)) && (ptsPointerPos.y <= 90+17+16+(iActualRow*30)))
                              {
                              if ((ptsPointerPos.x >= 68) && (ptsPointerPos.x <= 87))
                                 {
                                 if (GuessedColors[4*iActualRow] != -1)
                                    {
                                    dragStartPos = 0;
                                    iDragColor = GuessedColors[4*iActualRow];
                                    dragging = TRUE;
                                    hps = WinGetPS(hwnd);
                                    clearPin(hps, dragStartPos);
                                    WinReleasePS(hps);
                                    }
                                 }
                              else
                                 if ((ptsPointerPos.x >= 114) && (ptsPointerPos.x <= 133))
                                    {
                                    if (GuessedColors[(4*iActualRow)+1] != -1)
                                       {
                                       dragStartPos = 1;
                                       iDragColor = GuessedColors[(4*iActualRow)+1];
                                       dragging = TRUE;
                                       hps = WinGetPS(hwnd);
                                       clearPin(hps, dragStartPos);
                                       WinReleasePS(hps);
                                       }
                                    }
                                 else
                                    if ((ptsPointerPos.x >= 151) && (ptsPointerPos.x <= 170))
                                       {
                                       if (GuessedColors[(4*iActualRow)+2] != -1)
                                          {
                                          dragStartPos = 2;
                                          iDragColor = GuessedColors[(4*iActualRow)+2];
                                          dragging = TRUE;
                                          hps = WinGetPS(hwnd);
                                          clearPin(hps, dragStartPos);
                                          WinReleasePS(hps);
                                          }
                                       }
                                    else
                                       if ((ptsPointerPos.x >= 188) && (ptsPointerPos.x <= 207))
                                          {
                                          if (GuessedColors[(4*iActualRow)+3] != -1)
                                             {
                                             dragStartPos = 3;
                                             iDragColor = GuessedColors[(4*iActualRow)+3];
                                             dragging = TRUE;
                                             hps = WinGetPS(hwnd);
                                             clearPin(hps, dragStartPos);
                                             WinReleasePS(hps);
                                             }
                                          }
                                       else /* x ist nicht in einer der Markierungen */
                                       {
                                          dragStartPos = -1;
                                       }
                              }
                           else /* y ist nicht im oberen Feld */
                              {
                              dragStartPos = -1;
                              }
                           } /* endeelseif ptspointerpos.y */
                        } /* endif mp2 */
                     /* aktuellen Mauszeiger sichern */
                     hptrDefault = WinQueryPointer(HWND_DESKTOP);
                     /* Mauszeiger setzen */
                     WinSetPointer(HWND_DESKTOP, PointersForUse[iDragColor]);
/*                     switch (iDragColor)
                        {
                        case IDB_RED: WinSetPointer(HWND_DESKTOP, hptrRed);
                           break;
                        case IDB_GREEN: WinSetPointer(HWND_DESKTOP, hptrGreen);
                           break;
                        case IDB_BLUE: WinSetPointer(HWND_DESKTOP, hptrBlue);
                           break;
                        case IDB_YELLOW: WinSetPointer(HWND_DESKTOP, hptrYellow);
                           break;
                        case IDB_CYAN: WinSetPointer(HWND_DESKTOP, hptrCyan);
                           break;
                        case IDB_PINK: WinSetPointer(HWND_DESKTOP, hptrPink);
                           break;
                        default:
                           break;
                        }
*/
                     }
                  break;

    case WM_COMMAND:
                     ControlProg(hwnd, msg, mp1, mp2);
                  break;

    case WM_TIMER:
                     if ((Playing == TRUE) && (Paused == FALSE))
                        {
                        seconds += 1;
                        hps = WinGetPS(hwnd);
                        DrawTime(hps);
                        WinReleasePS(hps);
                        }
                  break;

    case WM_CLOSE:
                  /* Sicherheitsabfrage */
                  if (Playing == TRUE)
                     {
                     if (!WinLoadString(hab, hmodDLLNational, IDS_REALLYQUIT, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     if (!WinLoadString(hab, hmodDLLNational, IDS_EXIT, sizeof(title), title))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);

                     rc = WinMessageBox(HWND_DESKTOP,
                                   hwnd,
                                   resourceText,
                                   title,
                                   DLG_MSGBOX,
                                   MB_YESNO | MB_ICONQUESTION | MB_MOVEABLE);
                     }
                  else
                     rc = MBID_YES;

                  if (rc != MBID_YES)
                     return (void*)TRUE;
                  else {
                     WriteSettings();
                     WinPostMsg(hwnd, WM_QUIT, 0L, 0L);
                     }
               break;
//    case WM_CHAR:
//                  /* Taste beim HerunterdrÅcken identifizieren */
//                  if (!(CHARMSG(&msg)->fs & KC_KEYUP)) {
//                     switch (SHORT2FROMMP(mp2)) {
//                        case VK_PAUSE :
//                           /* MenÅauswahl Pause/Unpause simulieren */
//                           if (Playing == TRUE)
//                              WinSendMsg(hwnd, WM_COMMAND, MPFROMSHORT(IDM_PAUSE), NULL);
//                           return (void*)TRUE;
//                           break;
//                        } /* switch */
//                     } /* if */
//                     return (void*)FALSE;
//               break;
//    case WM_QUERYTRACKINFO:
//                  error("WM_QUERYTRACKINFO", FALSE);
//                  if (WinQueryWindowULong( WinWindowFromID(hwnd, FID_CLIENT), QWL_TRACKING) )
//                     {
//                     PTRACKINFO pti;
//                     MRESULT mReturn = 0L;
//
//                     /* Let the PM frame window function initialize TRACKINFO */
//                     /* mReturn = (*pfnFrameProc) (hwnd, msg, mp1, mp2);*/
//                     mReturn = WinDefWindowProc(hwnd, msg, mp1, mp2);
//                     pti                    = (PTRACKINFO)mp2;
//                     pti->ptlMinTrackSize.x = INITIALWIDTH;
//                     pti->ptlMinTrackSize.y = INITIALHEIGHT;
//                     pti->ptlMaxTrackSize.x = INITIALWIDTH;
//                     pti->ptlMaxTrackSize.y = INITIALHEIGHT;
//                     return(mReturn);
//                     }
//                  break;

    default : return WinDefWindowProc(hwnd, msg, mp1, mp2);
  }
  return WinDefWindowProc(hwnd, msg, mp1, mp2);
}

int DrawBitmap(HPS hps, int BitmapID, int height, int width, int posx, int posy)
/******************************************************/
/* Darstellen eines Bitmaps anhand der Åbergebenen    */
/* Parameter                                          */
/******************************************************/
{
   PPOINTL pptlDst;
   POINTL  ptlDst;
   HBITMAP hbm, hbmPrevious;
   int     rc;

   pptlDst = &ptlDst;
   /* load the bit map from global DLL */
   hbm = GpiLoadBitmap(hps, hmodDLLGlobal, BitmapID, height, width);
   hbmPrevious = GpiSetBitmap(hps, hbm);  /* select bit map for PS */
   pptlDst->x = posx;
   pptlDst->y = posy;
   rc = (int) WinDrawBitmap(hps, hbm, NULL, pptlDst, 0L, 0L, DBM_NORMAL);

   return rc;
}

int Draw3DBox(HPS hps, int posx, int posy, int width, int height, COLOR lBackground, int iFillmode)
/******************************************************/
/* Zeichnen einer Box, die 3-dimensional aussieht     */
/*                                                    */
/* FÅr iFillmode exisiteren folgende Defines:         */
/*  MSTM_FILL   fÅllt die Box mit der angegeben Farbe */
/*  MSTM_NOFILL nur der Rahmen wir gezeichnet         */
/******************************************************/
{
   POINTL ptlStart, ptlEdge;
   LONG   lOldColor;

   /* alte Zeichendfarbe merken */
   lOldColor=GpiQueryColor(hps);

   /* falls Hintergrund gefÅllt werden soll, entsprechende Box zeichnen */
   if (iFillmode == MSTM_FILL)
      {
      GpiSetColor(hps, lBackground);
      ptlStart.x = posx + 2;
      ptlStart.y = posy + 2;
      GpiSetCurrentPosition(hps, &ptlStart);
      ptlEdge.x = ptlStart.x + width - 4;
      ptlEdge.y = ptlStart.y + height - 4;
      GpiBox(hps, DRO_FILL, &ptlEdge, 0L, 0L);
      }

   /* Ñu·ere Rahmenlinen zeichnen */
   GpiSetColor(hps, CLR_BLACK);
   ptlStart.x = posx;
   ptlStart.y = posy;
   ptlEdge.x = ptlStart.x;
   ptlEdge.y = ptlStart.y + height;
   GpiSetCurrentPosition(hps, &ptlStart);
   GpiLine(hps, &ptlEdge);
   ptlEdge.x = ptlEdge.x + width;
   GpiLine(hps, &ptlEdge);
   GpiSetColor(hps, CLR_WHITE);
   ptlEdge.y = ptlEdge.y - height;
   GpiLine(hps, &ptlEdge);
   ptlStart.x += 1;
   GpiLine(hps, &ptlStart);
   GpiSetColor(hps, CLR_BLACK);

   /* innere Rahmenlinien zeichnen */
   ptlStart.x = posx + 2;
   ptlStart.y = posy + 2;
   ptlEdge.x = ptlStart.x;
   ptlEdge.y = ptlStart.y + height - 4;
   GpiSetCurrentPosition(hps, &ptlStart);
   GpiLine(hps, &ptlEdge);
   ptlEdge.x = ptlEdge.x + width - 4;
   GpiLine(hps, &ptlEdge);
   GpiSetColor(hps, CLR_WHITE);
   ptlEdge.y = ptlEdge.y - height + 4;
   GpiLine(hps, &ptlEdge);
   ptlStart.x += 2;
   GpiLine(hps, &ptlStart);

   /* Zeichenfarbe wieder zurÅcksetzen */
   GpiSetColor(hps, lOldColor);
   return 0;
}


void CreateColors(void)
/******************************************************/
/* Finden der zu ratenden Zahlen                      */
/******************************************************/
{
   int available[6]={0, 1, 2, 3, 4, 5};
   int hilf;
   int i;

   if (Multiple == TRUE) {
      for (i=0; i<4; i++)
          MasterColors[i]=(rand() % 6);
      }
   else {
      for (i=0; i<4; i++)
         MasterColors[i]=(rand() % (6-i));
      for (i=0; i<4; i++) {
         hilf = MasterColors[i];
         MasterColors[i] = available[hilf];
         available[hilf] = available[5-i];
         }
      }
}


void init(void)
/******************************************************/
/* Starteinstellungen festlegen                       */
/******************************************************/
{
   struct timeb timebuffer;
   int i;

   _ftime(&timebuffer);
   srand(timebuffer.millitm);
   screenx = WinQuerySysValue(HWND_DESKTOP,SV_CXSCREEN);
   screeny = WinQuerySysValue(HWND_DESKTOP,SV_CYSCREEN);
   CreateColors();
// nur zum Testen:
//   guessed = TRUE;
// sonst:
   guessed = FALSE;
   iActualRow = 0;
   NumTries = -1;
   iDragColor = -1;
   dragging = FALSE;
   circle = 0;
   if (hwndButton != 0L)
      if (Playing != TRUE) {
         if (!WinLoadString(hab, hmodDLLNational, IDS_STARTNEWGAME, sizeof(resourceText), resourceText))
            error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
         WinSetWindowText(hwndButton, resourceText);
         WinEnableWindow(hwndButton, TRUE);
         }
   for (i=0; i<40; i++)
      {
      GuessedColors[i]=-1;
      Pins[i]=0;
      }
   seconds = 0;
   Paused = FALSE;
}



FIXED MakeFixed(int a, int b)
/******************************************************/
/* Umwandeln von zwei Interger-Zahlen in eine Fixed   */
/******************************************************/
{
   return a*65536 + b;
}


int DrawColors(HPS hps, int BitmapID, int column, int row)
/******************************************************/
/* Einzeichnen einer Farbe in der Box zum Raten       */
/******************************************************/
{
   DrawBitmap(hps, BitmapID, 16L, 19L, 69+(column*37), 107+(row*30));
   return 0;
}


int DrawMasterColors(HPS hps)
/******************************************************/
/* Einzeichnen der zu erratenden Farben               */
/******************************************************/
{
   DrawBitmap(hps, ColorsForUse[MasterColors[0]], 16L, 19L, 62, 450);
   DrawBitmap(hps, ColorsForUse[MasterColors[1]], 16L, 19L, 104, 450);
   DrawBitmap(hps, ColorsForUse[MasterColors[2]], 16L, 19L, 146, 450);
   DrawBitmap(hps, ColorsForUse[MasterColors[3]], 16L, 19L, 188, 450);
   return 0;
}

int DrawGuessedColors(HPS hps)
/******************************************************/
/* Einzeichnen der zu erratenden Farben               */
/******************************************************/
{
   int i;
   int row;
   int column;

   for (i=0; i<=NumTries; i++)
      if (GuessedColors[i]>=0)
         {
         row = i / 4;
         column = i % 4;
         DrawColors(hps, ColorsForUse[GuessedColors[i]], column, row);
         }
   return 0;
}


int DrawRowNumbers(HPS hps)
/******************************************************/
/* Einzeichnen der Zeilennummern bis zur aktuellen Z. */
/******************************************************/
{
   POINTL ptlDrawPosition;
   INT    i;
   char   cNumber[4];

   GpiSetColor(hps, CLR_DARKBLUE);
   ptlDrawPosition.x = 20;
   for (i=0; i<=iActualRow && i<10; i++)
     {
      ptlDrawPosition.y = 90 + 11 + 8 + i*30;
      GpiSetCurrentPosition(hps, &ptlDrawPosition);
      sprintf(cNumber, "%d)", i+1);
      GpiCharString(hps, strlen(cNumber), (unsigned char*)&cNumber);
     }
  return 0;
}

int DrawActualMarks(HPS hps, int all)
/******************************************************/
/* Einzeichnen der Markierungen zum Fallenlassen bis  */
/* zur aktuellen Reihe inkl, oder nur aktuelle Reihe  */
/******************************************************/
{
   POINTL ptlDrawPosition;
   INT    i, j;
   ARCPARAMS arcp={1,1,0,0};

   GpiSetColor(hps, CLR_BLACK);
   GpiSetArcParams(hps, &arcp);
   if (all == TRUE)
      j = 0;
   else
      j = iActualRow;
   for (; j<=iActualRow && j<10; j++)
      {
      ptlDrawPosition.y = 90 + 17 + 8 + j*30;
      for (i=0; i<4; i++)
         {
         ptlDrawPosition.x = 50 + 18 + 9 + i*37;
         GpiSetCurrentPosition(hps, &ptlDrawPosition);
         GpiFullArc(hps, DRO_OUTLINE, MakeFixed(MARKRADIUS,0));
         }
      }
   return 0;
}

int DrawFutureMarks(HPS hps)
/******************************************************/
/* Einzeichnen der Markierungen zum Fallenlassen fÅr  */
/* zukÅnftige Rateversuche in Hellgrau                */
/******************************************************/
{
   POINTL ptlDrawPosition;
   INT    i, j;
   ARCPARAMS arcp={1,1,0,0};

   GpiSetColor(hps, CLR_PALEGRAY);
   GpiSetArcParams(hps, &arcp);
   if (iActualRow == 9)
      return 0;
   for (j=iActualRow+1; j<10; j++)
      {
      ptlDrawPosition.y = 90 + 17 + 8 + j*30;
      for (i=0; i<4; i++)
         {
         ptlDrawPosition.x = 50 + 18 + 9 + i*37;
         GpiSetCurrentPosition(hps, &ptlDrawPosition);
         GpiFullArc(hps, DRO_OUTLINE, MakeFixed(MARKRADIUS,0));
         }
      }
   return 0;
}


VOID ControlProg(HWND hwnd,ULONG msg, MPARAM mp1, MPARAM mp2)
/******************************************************/
/* Aktionen bei Knopfdruck und MenÅauswahlen          */
/******************************************************/
{
   HWND        hwndMenu;
   HWND        hwndAbout;
   HWND        hwndHighscore;
   HWND        hwndContainer;
   HWND        hwndListbox;
   HWND        hwndPinDialog;
   USHORT      command;
   HPS         hps;
   int         won;
   ULONG       rc;
   RECTL       rect;
   char        pszMenuText[15];
//   char        dummy[800];
   MRESULT     mresReply;
   Hscr        *HighHelp;
   Hscr        *Highscore;
   PRECORDCORE HighItem, HighItemAnchor;
   PFIELDINFO  Column, ColumnAnchor;
   RECORDINSERT recsIn;
   FIELDINFOINSERT fieldIn;
   CNRINFO     cnrInfo;
   int         i;
   static char nameTitle[TITLELENGTH];
   static char rankTitle[TITLELENGTH];
   static char triesTitle[TITLELENGTH];
   static char timeTitle[TITLELENGTH];
   char        title[30];
   static short NumOfLang = 0;
   static int   LangItem = 0;
   DllList     *Module = dllList;
   INT         State;
   PSZ  ModuleName = NULL;
   UCHAR LoadError[256] = "";            /* Bereich fÅr Ladefehlerinformation */
   UCHAR errmsg[500] = "";               /* Bereich fÅr Ladefehlerinformation */
   ULONG ulStyle;
   HWND hwndCurrentMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);

   /* das erste Mal NumOfLang initialisieren */
   if (!NumOfLang)
      while (Module) {
         NumOfLang++;
         Module = Module->Next;
         }

   /* das erste Mal LangItem initialiseren */
   if (!LangItem) {
      hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
      for(i=IDM_LANGUAGE+1; i <= IDM_LANGUAGE+NumOfLang; i++) {
         State = (INT) WinSendMsg(hwndMenu, MM_QUERYITEMATTR, MPFROM2SHORT(i, TRUE), MPFROMSHORT(MIA_CHECKED));
         State &= MIA_CHECKED;
         if (State == MIA_CHECKED)
            LangItem = i;
         }
      }

   command = SHORT1FROMMP(mp1);
   switch (command)
   {
      case IDPB_TAKEOVER:
                  /* Pushbutton inaktiv machen */
                  if (Playing == TRUE) {
                     WinEnableWindow(hwndButton, FALSE);
                  } else {
                     WinSendMsg(hwnd, WM_COMMAND, MPFROMSHORT(IDM_START), NULL);
                     break;
                  }
                  /* Auswertung der Rateversuche */
                  hps = WinGetPS(hwnd);
                  won = CheckColors(hps, hwnd);
                  if (won != TRUE)
                     {
                     /* nÑchste Reihe schwarze Kreise zeichnen und Nummer davor schreiben */
                     iActualRow += 1;
                     if (iActualRow <= 9)
                        {
                        DrawActualMarks(hps, FALSE);
                        DrawRowNumbers(hps);
                        }
                     }
                  WinReleasePS(hps);
                  if (iActualRow >= 10)
                     Loose(hwnd);
                  /* Text im Pushbutton neu setzen */
                  if (won != TRUE)
                     {
                     switch (iActualRow)
                        {
                        case 1 : if (!WinLoadString(hab, hmodDLLNational, IDS_SECONDTRY, sizeof(resourceText), resourceText))
                                    error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                                 WinSetWindowText(hwndButton, resourceText);
                           break;
                        case 2 : if (!WinLoadString(hab, hmodDLLNational, IDS_THIRDTRY, sizeof(resourceText), resourceText))
                                    error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                                 WinSetWindowText(hwndButton, resourceText);
                           break;
                        case 3 : if (!WinLoadString(hab, hmodDLLNational, IDS_FOURTHTRY, sizeof(resourceText), resourceText))
                                    error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                                 WinSetWindowText(hwndButton, resourceText);
                           break;
                        case 4 : if (!WinLoadString(hab, hmodDLLNational, IDS_FIFTHTRY, sizeof(resourceText), resourceText))
                                    error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                                 WinSetWindowText(hwndButton, resourceText);
                           break;
                        case 5 : if (!WinLoadString(hab, hmodDLLNational, IDS_SIXTHTRY, sizeof(resourceText), resourceText))
                                    error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                                 WinSetWindowText(hwndButton, resourceText);
                           break;
                        case 6 : if (!WinLoadString(hab, hmodDLLNational, IDS_SEVENTHTRY, sizeof(resourceText), resourceText))
                                    error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                                 WinSetWindowText(hwndButton, resourceText);
                           break;
                        case 7 : if (!WinLoadString(hab, hmodDLLNational, IDS_EIGHTTHTRY, sizeof(resourceText), resourceText))
                                    error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                                 WinSetWindowText(hwndButton, resourceText);
                           break;
                        case 8 : if (!WinLoadString(hab, hmodDLLNational, IDS_NINETHTRY, sizeof(resourceText), resourceText))
                                    error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                                 WinSetWindowText(hwndButton, resourceText);
                           break;
                        case 9 : if (!WinLoadString(hab, hmodDLLNational, IDS_TENTHTRY, sizeof(resourceText), resourceText))
                                    error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                                 WinSetWindowText(hwndButton, resourceText);
                           break;
                        }
                     }
                  return;
               break;

      case IDM_START:
                  /* Sicherheitsabfrage */
                  if (Playing == TRUE)
                     {
                     if (!WinLoadString(hab, hmodDLLNational, IDS_REALLYSTART, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     if (!WinLoadString(hab, hmodDLLNational, IDS_START, sizeof(title), title))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     rc = WinMessageBox(HWND_DESKTOP,
                                   hwnd,
                                   resourceText,
                                   title,
                                   DLG_MSGBOX,
                                   MB_YESNO | MB_ICONQUESTION | MB_MOVEABLE);
                     if (rc != MBID_YES)
                        break;
                     }
                  /* Werte zurÅcksetzen */
                  if (!WinLoadString(hab, hmodDLLNational, IDS_FIRSTTRY, sizeof(resourceText), resourceText))
                     error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                  WinSetWindowText(hwndButton, resourceText);
                  WinEnableWindow(hwndButton, FALSE);
                  Playing = TRUE;
                  init();
                  /* MenÅ "Cancel game" aktivieren */
                  hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
                  WinEnableMenuItem(hwndMenu, IDM_CANCEL, TRUE);
                  WinEnableMenuItem(hwndMenu, IDM_PAUSE, TRUE);
                  WinEnableMenuItem(hwndMenu, IDM_MULTIPLE, FALSE);
                  /* Fenster neu zeichnen */
                  WinQueryWindowRect(hwnd, &rect);
                  WinInvalidateRect(hwnd, &rect, TRUE);
                  return;
               break;
      case IDM_EXIT:
                  WinPostMsg(hwnd, WM_CLOSE, 0L, 0L);
                  return;
               break;
      case IDM_CANCEL:
                  /* Sicherheitsabfrage */
                  if (!WinLoadString(hab, hmodDLLNational, IDS_REALLYCANCEL, sizeof(resourceText), resourceText))
                     error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                  if (!WinLoadString(hab, hmodDLLNational, IDS_CANCEL, sizeof(title), title))
                     error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                  rc = WinMessageBox(HWND_DESKTOP,
                                hwnd,
                                resourceText,
                                title,
                                DLG_MSGBOX,
                                MB_YESNO | MB_ICONQUESTION | MB_MOVEABLE);
                  if (rc != MBID_YES)
                     return;
                  hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
                  WinEnableMenuItem(hwndMenu, IDM_CANCEL, FALSE);
                  WinEnableMenuItem(hwndMenu, IDM_PAUSE, FALSE);
                  WinEnableMenuItem(hwndMenu, IDM_MULTIPLE, TRUE);
                  Playing = FALSE;
                  guessed = TRUE;
                  if (!WinLoadString(hab, hmodDLLNational, IDS_STARTNEWGAME, sizeof(resourceText), resourceText))
                     error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                  WinSetWindowText(hwndButton, resourceText);
                  WinEnableWindow(hwndButton, TRUE);
                  if (Paused == TRUE) {
                     /* MenÅpunkt "Unpause game" umbenennen */
                     if (!WinLoadString(hab, hmodDLLNational, IDS_PAUSE, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
                     mresReply = WinSendMsg(hwndMenu, MM_SETITEMTEXT, (MPARAM)IDM_PAUSE, (MPARAM)resourceText);
                     Paused = FALSE;
                     }
                  WinQueryWindowRect(hwnd, &rect);
                  WinInvalidateRect(hwnd, &rect, TRUE);
                  return;
               break;
      case IDM_PAUSE:
                  /* wenn Spiel lÑuft, Pause einschalten */
                  if (Paused == FALSE)
                     {
                     Paused = TRUE;
                     /* MenÅpunkt "Pause game" umbenennen */
                     if (!WinLoadString(hab, hmodDLLNational, IDS_UNPAUSE, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
                     mresReply = WinSendMsg(hwndMenu, MM_SETITEMTEXT, (MPARAM)IDM_PAUSE, (MPARAM)resourceText);
                     /* Fenster neu zeichnen */
                     WinQueryWindowRect(hwnd, &rect);
                     WinInvalidateRect(hwnd, &rect, TRUE);
                     }
                  /* Spiel bereits pausiert */
                  else
                     {
                     Paused = FALSE;
                     /* MenÅpunkt "Unpause game" umbenennen */
                     if (!WinLoadString(hab, hmodDLLNational, IDS_PAUSE, sizeof(resourceText), resourceText))
                        error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
                     hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
                     mresReply = WinSendMsg(hwndMenu, MM_SETITEMTEXT, (MPARAM)IDM_PAUSE, (MPARAM)resourceText);
                     /* Fenster neu zeichnen */
                     WinQueryWindowRect(hwnd, &rect);
                     WinInvalidateRect(hwnd, &rect, TRUE);
                     }
                  return;
               break;
      case IDM_MULTIPLE:
                  /* wenn selektiert */
                  if (Multiple == TRUE) {
                     /* MenÅitem deselektieren */
                     hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
                     WinCheckMenuItem(hwndMenu, IDM_MULTIPLE, FALSE);
                     /* neuen Wert merken */
                     Multiple = FALSE;
                     }
                  /* wenn nicht selektiert */
                  else {
                     /* MenÅitem selektieren */
                     hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
                     WinCheckMenuItem(hwndMenu, IDM_MULTIPLE, TRUE);
                     /* neuen Wert merken */
                     Multiple = TRUE;
                     }
                  return;
               break;
      case IDM_HIGHSCORE:
                  /* Highscoreliste einlesen (sortiert abgespeichert) */
                  Highscore = ReadHighscore();
                  /* Anzeigen der Highscore */
                  hwndHighscore = WinLoadDlg(HWND_DESKTOP, WinQueryWindow(hwnd, QW_PARENT), (PFNWP)HighscoreDlgProc, hmodDLLNational, DLG_HIGHSCORE, NULL);
                  WinSetWindowPos(hwndHighscore, HWND_TOP,
                                (WinQuerySysValue(HWND_DESKTOP, SV_CXSCREEN)-450)/2,
                                (WinQuerySysValue(HWND_DESKTOP, SV_CYSCREEN)-330)/2,
                                450, 330,
                                SWP_SIZE | SWP_MOVE | SWP_ACTIVATE | SWP_SHOW);

                  /* create and fill container */
                  FillContainer(hwndHighscore, Highscore, triesTitle, nameTitle, rankTitle, timeTitle);

                  WinProcessDlg(hwndHighscore);
                  WinDestroyWindow(hwndHighscore);
                  /* Highscore-Liste aus Speicher entfernen */
                  FreeHighscore(Highscore);
                  return;
               break;

      case IDM_GENERALHELP:
               WinSendMsg(hwndHelpInstance,
                    HM_DISPLAY_HELP,
                    MPFROMLONG(MAKELONG(PANEL_WELCOME, NULL)),
                    MPFROMSHORT(HM_RESOURCEID));
               return;
               break;

      case IDM_RULES:
               WinSendMsg(hwndHelpInstance,
                    HM_DISPLAY_HELP,
                    MPFROMLONG(MAKELONG(PANEL_RULES, NULL)),
                    MPFROMSHORT(HM_RESOURCEID));
               return;
               break;

      case IDM_HOWTOPLAY:
               WinSendMsg(hwndHelpInstance,
                    HM_DISPLAY_HELP,
                    MPFROMLONG(MAKELONG(PANEL_HOWTOPLAY, NULL)),
                    MPFROMSHORT(HM_RESOURCEID));
               return;
               break;

      case IDM_LICENSE:
               WinSendMsg(hwndHelpInstance,
                    HM_DISPLAY_HELP,
                    MPFROMLONG(MAKELONG(PANEL_LICENSE, NULL)),
                    MPFROMSHORT(HM_RESOURCEID));
               return;
               break;

      case IDM_ABOUT:
               /* About-Dialog */
               hwndAbout = WinLoadDlg( HWND_DESKTOP,    /* Place anywhere on desktop    */
                                   HWND_DESKTOP,    /* Owned by desk top            */
                                   (PFNWP)ProdInfoDlgProc,   /* Addr. of procedure  */
                                   hmodDLLNational,      /* Module handle                */
                                   DLG_ABOUT,       /* Dialog identifier in resource*/
                                   NULL);           /* Initialization data          */
               WinSetWindowPos(hwndAbout, HWND_TOP,
                                (WinQuerySysValue(HWND_DESKTOP, SV_CXSCREEN)-390)/2,
                                (WinQuerySysValue(HWND_DESKTOP, SV_CYSCREEN)-330)/2,
                                366, 330,
                                SWP_SIZE | SWP_MOVE | SWP_ACTIVATE | SWP_SHOW);
               WinProcessDlg(hwndAbout);
               WinDestroyWindow(hwndAbout);
               return;

      case IDM_PINSELECTION:
               hwndPinDialog = WinLoadDlg(HWND_DESKTOP, WinQueryWindow(hwnd, QW_PARENT), (PFNWP)PinSelectionDlgProc, hmodDLLNational, DLG_PINSELECTION, NULL);
/*               WinSetWindowPos(hwndPinDialog, HWND_TOP,
                               (WinQuerySysValue(HWND_DESKTOP, SV_CXSCREEN)-300)/2,
                               (WinQuerySysValue(HWND_DESKTOP, SV_CYSCREEN)-283)/2,
                               300, 283,
                               SWP_SIZE | SWP_MOVE | SWP_ACTIVATE | SWP_SHOW);
*/               return;

   }  /* end switch */

   /* Menu fÅr Sprachauswahl */
   if ((command > IDM_LANGUAGE) && (command <= IDM_LANGUAGE+NumOfLang)) {
      /* wenn gleicher Sprache nochmals ausgewÑhlt, einfach nix tun */
      if (command == LangItem)
         return;
      /* neuen MenÅpunkt auswÑhlen */
      hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
      WinCheckMenuItem(hwndMenu, command, TRUE);
      /* alten MenÅpunkt deselektieren */
      WinCheckMenuItem(hwndMenu, LangItem, FALSE);
      /* neue Sprache merken */
      LangItem = command;
      /* geladene Sprach-DLL verwerfen */
      DosFreeModule(hmodDLLNational);
      /* neue Sprach-DLL laden */
      if (ModuleName) {
        free(ModuleName);
        ModuleName = NULL;
        }
      if (Language) {
         free(Language);
         Language = NULL;
         }
      i = (int) WinSendMsg(hwndMenu, MM_QUERYITEMTEXTLENGTH, (MPARAM)LangItem, (MPARAM)0);
      Language = malloc(i+1);
      WinSendMsg(hwndMenu, MM_QUERYITEMTEXT, MPFROM2SHORT(LangItem, (short)(i+1)), (MPARAM)Language);
      ModuleName = GetModuleName();
      rc = DosLoadModule(LoadError,
                 sizeof(LoadError),
                 ModuleName,
                 &hmodDLLNational);
      if(rc != NO_ERROR) {
        sprintf(errmsg, "The file %s was not found! If you do not have it, please obtain it from the Mastermind/2 homepage at http://www.geocities.com/SiliconValley/Port/4718/ by downloading one of the national packages. Mastermind/2 will not run without this file. The errormessage returned by OS/2 was: \"%s\"", ModuleName, LoadError);
        error(errmsg, TRUE);
        }
      if (ModuleName) {
        free(ModuleName);
        ModuleName = NULL;
        }
      /* alle MenÅpunkte neu */
      if (hwndCurrentMenu) {
         WinSetParent(hwndCurrentMenu, WinQueryObjectWindow(HWND_DESKTOP), FALSE);
         WinSetOwner(hwndCurrentMenu, WinQueryObjectWindow(HWND_DESKTOP));
         }
      WinSendMsg(WinQueryWindow(hwnd, QW_PARENT), WM_UPDATEFRAME, (MPARAM)FCF_MENU, NULL);
      ulStyle = WinQueryWindowULong(hwndMenu, QWL_STYLE);
      ulStyle |= MS_ACTIONBAR | WS_CLIPSIBLINGS;
      ulStyle &= ~WS_SAVEBITS;
      hwndMenu = WinLoadMenu(WinQueryWindow(hwnd, QW_PARENT), hmodDLLNational, ID_MAIN);
      WinSetWindowULong(hwndMenu, QWL_STYLE, ulStyle);
      WinSetWindowUShort(hwndMenu, QWS_ID, FID_MENU);
      WinSetParent(hwndMenu, WinQueryWindow(hwnd, QW_PARENT), FALSE);
      WinSetOwner(hwndMenu, WinQueryWindow(hwnd, QW_PARENT));
      WinSendMsg(WinQueryWindow(hwnd, QW_PARENT), WM_UPDATEFRAME, (MPARAM)FCF_MENU, NULL);
      SetLanguageMenu(hwndMenu);
      /* Button neu */
      if (!Playing) {
         if (!WinLoadString(hab, hmodDLLNational, IDS_STARTNEWGAME, sizeof(resourceText), resourceText))
            error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
         }
      else { /* if playing */
         if (!WinLoadString(hab, hmodDLLNational, IDS_FIRSTTRY + iActualRow, sizeof(resourceText), resourceText))
            error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
         }
      WinSetWindowText(hwndButton, resourceText);
      /* Fenster neu zeichnen */
      WinQueryWindowRect(hwnd, &rect);
      WinInvalidateRect(hwnd, &rect, TRUE);
      /* Hilfe in neuer Sprache laden */
      DestroyHelpInstance();
      InitHelp(hwnd);
      /* fertig */
      return;
      }

   return;
}


int CheckColors(HPS hps, HWND hwnd)
/******************************************************/
/* Auswertung der Farben in der Aktuellen Reihe       */
/******************************************************/
{
   int MasterChecked[4] = {FALSE,FALSE,FALSE,FALSE};
   int GuessedChecked[4] = {FALSE,FALSE,FALSE,FALSE};
   int AllRight=TRUE;
   int i, j;

   /* richtige Farbe und richtige Stelle */
   for (i=0; i<=3; i++)
      if (MasterColors[i] == GuessedColors[(iActualRow*4)+i])
         {
         Pins[(iActualRow*4)+i] = BOTHRIGHT;
         MasterChecked[i] = TRUE;
         GuessedChecked[i] = TRUE;
         }
   /* nur richtige Farbe */
   for (i=0; i<=3; i++)
      for (j=0; j<=3; j++)
         if ((i!=j) && (MasterChecked[i]!=TRUE) && (GuessedChecked[j]!=TRUE))
            if (MasterColors[i] == GuessedColors[(iActualRow*4)+j])
               {
               Pins[(iActualRow*4)+j] = RIGHTPLACE;
               MasterChecked[i] = TRUE;
               GuessedChecked[j] = TRUE;
               }
   /* Pins einzeichnen */
   DrawPins(hps);
   /* feststellen, ob alle Farben richtig und an der richtigen Stelle sind */
   for (i=0; i<=3; i++)
      if (Pins[(iActualRow*4)+i] != BOTHRIGHT)
         AllRight = FALSE;
   if (AllRight == TRUE)
      {
      Win(hwnd);
      return TRUE;
      }

   return FALSE;
}

void Loose(HWND hwnd)
/******************************************************/
/* Aktionen bei Verlieren                             */
/******************************************************/
{
   char message[300];
   RECTL rect;
   HWND hwndMenu;

   Playing = FALSE;
   guessed = TRUE;
   hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
   WinEnableMenuItem(hwndMenu, IDM_CANCEL, FALSE);
   WinEnableMenuItem(hwndMenu, IDM_PAUSE, FALSE);
   WinEnableMenuItem(hwndMenu, IDM_MULTIPLE, TRUE);
   if (!WinLoadString(hab, hmodDLLNational, IDS_STARTNEWGAME, sizeof(resourceText), resourceText))
      error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
   WinSetWindowText(hwndButton, resourceText);
   WinEnableWindow(hwndButton, TRUE);
   WinQueryWindowRect(hwnd, &rect);
   WinInvalidateRect(hwnd, &rect, TRUE);
   if (!WinLoadString(hab, hmodDLLNational, IDS_OHNO, sizeof(resourceText), resourceText))
      error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
   sprintf(message, "%s %d", resourceText, seconds/60);
   if (!WinLoadString(hab, hmodDLLNational, IDS_MINUTESANDLOOSE, sizeof(resourceText), resourceText))
      error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
   sprintf(message, "%s %s %d", message, resourceText, seconds%60);
   if (!WinLoadString(hab, hmodDLLNational, IDS_SECONDSTOWASTE, sizeof(resourceText), resourceText))
      error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
   sprintf(message, "%s %s", message, resourceText);

   if (!WinLoadString(hab, hmodDLLNational, IDS_DAMN, sizeof(resourceText), resourceText))
      error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
   WinMessageBox(HWND_DESKTOP,
                 hwnd,
                 message,
                 resourceText,
                 DLG_MSGBOX,
                 MB_OK | MB_ICONEXCLAMATION | MB_MOVEABLE);
}

void Win(HWND hwnd)
/******************************************************/
/* Aktionen bei Gewinnnen                             */
/******************************************************/
{
   RECTL rect;
   HWND  hwndMenu;
   Hscr  *Highscore;
   Hscr  *HighHelp;
   int   HighPos;
   int   stop;
   int   stopInner;

   Playing = FALSE;
   guessed = TRUE;
   hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
   WinEnableMenuItem(hwndMenu, IDM_CANCEL, FALSE);
   WinEnableMenuItem(hwndMenu, IDM_PAUSE, FALSE);
   WinEnableMenuItem(hwndMenu, IDM_MULTIPLE, TRUE);
   if (!WinLoadString(hab, hmodDLLNational, IDS_STARTNEWGAME, sizeof(resourceText), resourceText))
      error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
   WinSetWindowText(hwndButton, resourceText);
   WinEnableWindow(hwndButton, TRUE);
   WinQueryWindowRect(hwnd, &rect);
   WinInvalidateRect(hwnd, &rect, TRUE);
   /* Highscoreliste einlesen (sortiert abgespeichert) */
   Highscore = ReadHighscore();
   /* feststellen, ob Eintrag in Highscore */
   HighHelp = Highscore;
   HighPos = 1;
   stop = FALSE;
   while ((HighHelp != NULL) && (HighPos <= 10) && (stop != TRUE)) {
      if (iActualRow+1 < HighHelp->Tries) {
         Highscore = Eintragen(HighHelp, HighHelp->Prev, Highscore, HighPos, hwnd);
         stop = TRUE;
         }
      else {
         if (iActualRow+1 == HighHelp->Tries) {
            if (seconds < (HighHelp->Minutes*60 + HighHelp->Seconds)) {
               Highscore = Eintragen(HighHelp, HighHelp->Prev, Highscore, HighPos, hwnd);
               stop = TRUE;
               }
            else {
               stopInner = FALSE;
               while ((HighHelp->Next != NULL) && (iActualRow+1 == HighHelp->Next->Tries) && (stopInner != TRUE)) {
                  if (HighHelp->Next != NULL) {
                     HighHelp = HighHelp->Next;
                     HighPos += 1;
                     }
                  else
                     stopInner = TRUE;
                  if (seconds < (HighHelp->Minutes*60 + HighHelp->Seconds)) {
                     Highscore = Eintragen(HighHelp, HighHelp->Prev, Highscore, HighPos, hwnd);
                     stopInner = TRUE;
                     }
                  }
               if (stopInner != TRUE)
                  Highscore = Eintragen(HighHelp->Next, HighHelp, Highscore, HighPos, hwnd);
               stop = TRUE;
               }
            }
         HighHelp = HighHelp->Next;
         HighPos += 1;
         }
      }
   if ((HighPos <= 10) && (stop != TRUE)){
      if (Highscore != NULL) {
         HighHelp = Highscore;
         while (HighHelp->Next != NULL) HighHelp = HighHelp->Next;
         Highscore = Eintragen(NULL, HighHelp, Highscore, HighPos, hwnd);
         }
      else
         Highscore = Eintragen(NULL, NULL, Highscore, HighPos, hwnd);
      }
   WriteHighscore(Highscore);
   FreeHighscore(Highscore);

/*   if (iActualRow+1 != 1)
      sprintf(message, "Congratulations!!!\n\nYou win! It took you %d tries (%d minutes and %d seconds) to guess my colors. To see how good you were take a look at the highscores.", iActualRow+1, seconds/60, seconds%60);
   else
      sprintf(message, "Congratulations!!!\n\nYou win! It took you only 1 try (%d minutes and %d seconds) to guess my colors. Go ahead to the casino and don't waste your luck on mastermind :-)", seconds/60, seconds%60);

   WinMessageBox(HWND_DESKTOP,
                 hwnd,
                 message,
                 "You've got it!!!",
                 0,
                 MB_OK | MB_ICONEXCLAMATION | MB_MOVEABLE);
*/
   WinSendMsg(hwnd, WM_COMMAND, MPFROMSHORT(IDM_HIGHSCORE), NULLHANDLE);
}


int DrawPins(HPS hps)
/******************************************************/
/* Einzeichnen der Signalpins                         */
/******************************************************/
{
   int x,y;
   int i,r,c;
   int BothRight=0, RightPlace=0;

   for (r=0; r<=iActualRow; r++)
      {
      for (c=0; c<4; c++)
         {
         if (Pins[(r*4)+c] == BOTHRIGHT)
            BothRight += 1;
         else
            if (Pins[(r*4)+c] == RIGHTPLACE)
               RightPlace += 1;
         }
      y = 107+(r*30);
      if (RightPlace != 0)
         {
         x = 230;
         for (i=1; i<=RightPlace; i++)
            {
            DrawBitmap(hps, RIGHTPLACE, 21, 21, x, y);
            x +=25;
            }
         RightPlace = 0;
         }
      if (BothRight != 0)
         {
         x = 350;
         for (i=1; i<=BothRight; i++)
            {
            DrawBitmap(hps, BOTHRIGHT, 21, 21, x, y);
            x += 25;
            }
         BothRight = 0;
         }
      }
   return 0;
}

int DrawTime(HPS hps)
/******************************************************/
/* Einzeichnen der abgelaufenen Zeit                  */
/******************************************************/
{
   char cTime[20];
   LONG mins, secs, oldColor;
   POINTL ptlDrawPosition;
   RECTL rect;

   rect.xLeft = 400;
   rect.yBottom = 520;
   rect.xRight = INITIALWIDTH;
   rect.yTop = INITIALHEIGHT;
   WinFillRect(hps, &rect, CLR_PALEGRAY);
   mins = seconds / 60;
   secs = seconds % 60;
   sprintf(cTime, "%d:%02d", mins, secs);
   ptlDrawPosition.x = 400;
   ptlDrawPosition.y = 520;
   GpiSetCurrentPosition(hps, &ptlDrawPosition);
   oldColor = GpiQueryColor(hps);
   GpiSetColor(hps, CLR_DARKBLUE);
   GpiCharString(hps, strlen(cTime), cTime);
   ptlDrawPosition.x = 350;
   GpiSetCurrentPosition(hps, &ptlDrawPosition);
   GpiSetColor(hps, CLR_DARKBLUE);
   if (!WinLoadString(hab, hmodDLLNational, IDS_TIME, sizeof(resourceText), resourceText))
      error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
   GpiCharString(hps, strlen(resourceText), resourceText);
   GpiSetColor(hps, oldColor);
   return 0;
}


MRESULT EXPENTRY ProdInfoDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
/******************************************************/
/* Dialogprozedur fÅr About-Diaalog                   */
/******************************************************/
{
   RECTL rcl;
   HPS   hps;

   switch(msg)
   {
      case WM_INITDLG:
           WinSetPresParam(hwnd, PP_FONTNAMESIZE, (ULONG)sizeof("8.Helv"), (PVOID)"8.Helv");
           if (!WinLoadString(hab, hmodDLLNational, IDS_OKBUTTON, sizeof(resourceText), resourceText))
              error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
           WinCreateWindow(hwnd,
                                WC_BUTTON,
                                resourceText,
                                WS_VISIBLE | BS_PUSHBUTTON | BS_DEFAULT,
                                140, 18,
                                80, 36,
                                hwnd,
                                HWND_TOP,
                                DID_OK,
                                NULL,
                                NULL);
         break;
      case WM_TIMER:
      case WM_COMMAND:
         /*
          * No matter what the command, close the dialog
          */
         WinDismissDlg(hwnd, TRUE);
         break;

      default:
         return(WinDefDlgProc(hwnd, msg, mp1, mp2));
         break;
   }
   return (MRESULT)0;
}

MRESULT EXPENTRY HighscoreDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
/******************************************************/
/* Dialogprozedur fÅr About-Dialog                    */
/******************************************************/
{
   RECTL rcl;
   HPS   hps;
   HWND  hwndContainer;
   HWND  hwndOK;

   switch(msg)
   {
      case WM_INITDLG:
           if (!WinLoadString(hab, hmodDLLNational, IDS_OKBUTTON, sizeof(resourceText), resourceText))
              error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
           hwndOK = WinCreateWindow(hwnd,
                           WC_BUTTON,
                           resourceText,
                           WS_VISIBLE | BS_PUSHBUTTON | BS_DEFAULT,
                           185, 18,
                           80, 36,
                           hwnd,
                           HWND_TOP,
                           DID_OK,
                           NULL,
                           NULL);
/*             WinCreateWindow(hwnd,
                           WC_LISTBOX,
                           NULL,
                           WS_VISIBLE | LS_NOADJUSTPOS,
                           5, 72,
                           440, 168,
                           hwnd,
                           HWND_BOTTOM,
                           ID_LISTBOX,
                           NULL,
                           NULL);
           WinSetPresParam(hwnd, PP_FONTNAMESIZE, (ULONG)sizeof("8.Courier"), (PVOID)"8.Courier");
*/           WinSetPresParam(hwnd, PP_FONTNAMESIZE, (ULONG)sizeof("8.Helv"), (PVOID)"8.Helv");
        break;
      case WM_COMMAND:
         /*
          * No matter what the command, close the dialog
          */
         WinDismissDlg(hwnd, TRUE);
         break;

      default:
         return(WinDefDlgProc(hwnd, msg, mp1, mp2));
         break;
   }
   return (MRESULT)0;
}

MRESULT EXPENTRY PinSelectionDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
/******************************************************/
/* Dialogprozedur fÅr Pinauswahl-Dialog               */
/******************************************************/
{
   RECTL rcl;
   HPS   hps;
   HWND  hwndContainer;
   HWND  hwndOK;
   HWND  hwndCancel;
   static HWND  *hwndCB = NULL;
   static HBITMAP *hbmCB = NULL;
   int   oldColors[6];
   HBITMAP hbm;
   static short s = 0;
   short BitmapID = COLOR_OFFSET;
   int   x=85, y=18+36+25;
   ULONG style;
   int i, j, num;
   short NumChecked = 0;
   USHORT command;

   switch(msg)
   {
      case WM_INITDLG:
           if (!WinLoadString(hab, hmodDLLNational, IDS_OKBUTTON, sizeof(resourceText), resourceText))
              error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
           hwndOK = WinCreateWindow(hwnd,
                           WC_BUTTON,
                           resourceText,
                           WS_VISIBLE | BS_PUSHBUTTON | BS_DEFAULT,
                           60, 18,
                           80, 36,
                           hwnd,
                           HWND_TOP,
                           DID_OK,
                           NULL,
                           NULL);
           if (!WinLoadString(hab, hmodDLLNational, IDS_CANCELBUTTON, sizeof(resourceText), resourceText))
              error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
           hwndOK = WinCreateWindow(hwnd,
                           WC_BUTTON,
                           resourceText,
                           WS_VISIBLE | BS_PUSHBUTTON,
                           160, 18,
                           80, 36,
                           hwnd,
                           HWND_TOP,
                           DID_CANCEL,
                           NULL,
                           NULL);
           WinSetPresParam(hwnd, PP_FONTNAMESIZE, (ULONG)sizeof("8.Helv"), (PVOID)"8.Helv");
           WinSetWindowPos(hwnd, HWND_TOP,
                           (WinQuerySysValue(HWND_DESKTOP, SV_CXSCREEN)-300)/2,
                           (WinQuerySysValue(HWND_DESKTOP, SV_CYSCREEN)-283)/2,
                           300, 343,
                           SWP_SIZE | SWP_MOVE | SWP_ACTIVATE | SWP_SHOW);
           /* count pins in resource */
           hps = WinGetPS(hwnd);
           hbm = GpiLoadBitmap(hps, hmodDLLGlobal, BitmapID, 19L, 16L);
           while (hbm != GPI_ERROR) {
              s++;
              BitmapID++;
              hbm = GpiLoadBitmap(hps, hmodDLLGlobal, BitmapID, 19L, 16L);
              }
           hwndCB = (HWND *) malloc(sizeof(HWND)*s);
           hbmCB = (HBITMAP *) malloc(sizeof(HBITMAP)*s);
           /* create checkboxes */
           BitmapID = COLOR_OFFSET;
           s = 0;
           hbm = GpiLoadBitmap(hps, hmodDLLGlobal, BitmapID, 19L, 16L);
           while (hbm != GPI_ERROR) {
              hbmCB[s] = hbm;
              hwndCB[s] = WinCreateWindow(hwnd,
                           WC_BUTTON,
                           "",
                           WS_VISIBLE | BS_CHECKBOX,
                           x, y,
                           50, 19,
                           hwnd,
                           HWND_TOP,
                           BitmapID,
                           NULL,
                           NULL);
//              DrawBitmap(hps, BitmapID, 16L, 19L, x+25, y);
              y += 35;
              if (y >= 284) {
                 y = 18+36+25;
                 x += 80;
                 }
              s++;
              BitmapID++;
              hbm = GpiLoadBitmap(hps, hmodDLLGlobal, BitmapID, 19L, 16L);
              }
           /* check all selected pins */
           for (i=0; i<6; i++)
              WinCheckButton(hwnd, ColorsForUse[i], 1);
           /* count checked pins */
           num = 0;
           for (i=0; i<s; i++)
              if (WinQueryButtonCheckstate(hwnd, i + COLOR_OFFSET))
                 num++;
           /* if max is reached, grey out other pins */
           if (num >= 6) {
              for (i=0; i<s; i++)
                 if (!WinQueryButtonCheckstate(hwnd, i + COLOR_OFFSET))
                    WinEnableWindow(WinWindowFromID(hwnd, i + COLOR_OFFSET), FALSE);
              WinEnableWindow(WinWindowFromID(hwnd, DID_OK), TRUE);
              }
           else {
            WinEnableWindow(WinWindowFromID(hwnd, DID_OK), FALSE);
            }
           /* Draw pins */
           BitmapID = COLOR_OFFSET;
           x = 85;
           for(i=0; i<s; i++) {
              Draw3DBox(hps, x+25-5, y-5, 27, 27, CLR_DARKGRAY, MSTM_FILL);
              DrawBitmap(hps, BitmapID, 16L, 19L, x+25, y);
              BitmapID++;
              y += 35;
              if (y >= 284) {
                 y = 18+36+25;
                 x += 80;
                 }
              }
           WinReleasePS(hps);

        break;

      case WM_PAINT:
         WinDefDlgProc(hwnd, msg, mp1, mp2);
         BitmapID = COLOR_OFFSET;
         hps = WinGetPS(hwnd);
         for(i=0; i<s; i++) {
            Draw3DBox(hps, x+25-5, y-5, 27, 27, CLR_DARKGRAY, MSTM_FILL);
            DrawBitmap(hps, BitmapID, 16L, 19L, x+25, y);
            BitmapID++;
            y += 35;
            if (y >= 284) {
               y = 18+36+25;
               x += 80;
               }
            }
         WinReleasePS(hps);
         break;

      case WM_CONTROL:
         if (WinQueryButtonCheckstate(hwnd, SHORT1FROMMP(mp1)))
            WinCheckButton(hwnd, SHORT1FROMMP(mp1), 0);
         else
            WinCheckButton(hwnd, SHORT1FROMMP(mp1), 1);
         /* count checked pins */
         num = 0;
         for (i=0; i<s; i++)
            if (WinQueryButtonCheckstate(hwnd, i + COLOR_OFFSET))
               num++;
         /* if max is reached, grey out other pins */
         if (num >= 6) {
            for (i=0; i<s; i++)
               if (!WinQueryButtonCheckstate(hwnd, i + COLOR_OFFSET))
                  WinEnableWindow(WinWindowFromID(hwnd, i + COLOR_OFFSET), FALSE);
            WinEnableWindow(WinWindowFromID(hwnd, DID_OK), TRUE);
            /* Redraw Bitmaps */
            BitmapID = COLOR_OFFSET;
            hps = WinGetPS(hwnd);
            for(i=0; i<s; i++) {
               Draw3DBox(hps, x+25-5, y-5, 27, 27, CLR_DARKGRAY, MSTM_FILL);
               DrawBitmap(hps, BitmapID, 16L, 19L, x+25, y);
               BitmapID++;
               y += 35;
               if (y >= 284) {
                  y = 18+36+25;
                  x += 80;
                  }
               }
            WinReleasePS(hps);
            }
         else {
            for (i=0; i<s; i++)
               if (!WinQueryButtonCheckstate(hwnd, i + COLOR_OFFSET))
                  WinEnableWindow(WinWindowFromID(hwnd, i + COLOR_OFFSET), TRUE);
            WinEnableWindow(WinWindowFromID(hwnd, DID_OK), FALSE);
            /* Redraw Bitmaps */
            BitmapID = COLOR_OFFSET;
            hps = WinGetPS(hwnd);
            for(i=0; i<s; i++) {
               Draw3DBox(hps, x+25-5, y-5, 27, 27, CLR_DARKGRAY, MSTM_FILL);
               DrawBitmap(hps, BitmapID, 16L, 19L, x+25, y);
               BitmapID++;
               y += 35;
               if (y >= 284) {
                  y = 18+36+25;
                  x += 80;
                  }
               }
            WinReleasePS(hps);
            }
         break;

      case WM_COMMAND:
         command = SHORT1FROMMP(mp1);

         /* only for OK-Button */
         if (command == DID_OK) {
            /* alte Farben merken */
            for (i=0; i<6; i++)
               oldColors[i] = ColorsForUse[i];
            /* ausgewÑhlte Farben merken */
            num = 0;
            for (i=0; i<s; i++)
               if (WinQueryButtonCheckstate(hwnd, i + COLOR_OFFSET)) {
                  ColorsForUse[num] = i + COLOR_OFFSET;
                  num++;
                  }
            /* wieviele Farben sind gleich geblieben? */
            num = 0;
            for (i=0; i<6; i++)
               for (j=0; j<6; j++)
                  if (oldColors[i] == ColorsForUse[j]) {
                     num++;
                     break;
                     }
            /* only neccessary if at least one color changed */
            if (num < 6) {
               /* remove old pointers */
               for (i=0; i<6; i++)
                  WinDestroyPointer(PointersForUse[i]);
               /* load new pointers */
               for (i=0; i<6; i++)
                  PointersForUse[i] = WinLoadPointer(HWND_DESKTOP, hmodDLLGlobal, ColorsForUse[i]+COLOR_TO_POINTER_OFFSET);
               WinQueryWindowRect(WinWindowFromID(HWND_DESKTOP, ID_MAIN), &rcl);
               WinInvalidateRect(WinWindowFromID(HWND_DESKTOP, ID_MAIN), &rcl, TRUE);
               }
            }
         /* for OK and Cancel Button */
         /* free the used memory */
         if (hwndCB) {
            free(hwndCB);
            hwndCB = NULL;
            }
         if (hbmCB) {
            free(hbmCB);
            hbmCB = NULL;
            }
         /* throw away this dialog */
         WinDismissDlg(hwnd, TRUE);
         break;

      default:
         return(WinDefDlgProc(hwnd, msg, mp1, mp2));
         break;
   }
   return (MRESULT)0;
}

Hscr* Eintragen(Hscr* NextPos, Hscr* PrevPos, Hscr* Anchor, int Pos, HWND hwnd)
/******************************************************/
/* in die Highscore eintragen (vor NextPos)           */
/******************************************************/
{
   Hscr* newEntry;
   char  Name[100];
   HWND  hwndQueryName;
   char  pszQNT[200];

   /* Abfragen des Namens */
   hwndQueryName = WinLoadDlg(HWND_DESKTOP, hwnd, (PFNWP)QueryNameDlgProc, hmodDLLNational, DLG_QUERYNAME, Name);
   /* Text setzen */
   if (iActualRow != 0) {
      if (!WinLoadString(hab, hmodDLLNational, IDS_YOUNEEDED, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s %d", resourceText, iActualRow+1);
      if (!WinLoadString(hab, hmodDLLNational, IDS_TRIES, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s %s%d ", pszQNT, resourceText, seconds/60);
      if (!WinLoadString(hab, hmodDLLNational, IDS_MINUTESANDWIN, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s%s %d", pszQNT, resourceText, seconds%60);
      if (!WinLoadString(hab, hmodDLLNational, IDS_SECONDS, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s %s", pszQNT, resourceText);
      WinSetWindowText(WinWindowFromID(hwndQueryName, IDT_QNT2), pszQNT);
      if (!WinLoadString(hab, hmodDLLNational, IDS_THATSRANK, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s %d", resourceText, Pos);
      if (!WinLoadString(hab, hmodDLLNational, IDS_OFTHEHIGHSCORES, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s %s", pszQNT, resourceText);
      WinSetWindowText(WinWindowFromID(hwndQueryName, IDT_QNT3), pszQNT);
      }
   else {
      if (!WinLoadString(hab, hmodDLLNational, IDS_YOUONLYNEEDED, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s%d", resourceText, seconds/60);
      if (!WinLoadString(hab, hmodDLLNational, IDS_MINUTESANDONE, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s %s %d", pszQNT, resourceText, seconds%60);
      if (!WinLoadString(hab, hmodDLLNational, IDS_SECONDSONE, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s %s", pszQNT, resourceText);
      WinSetWindowText(WinWindowFromID(hwndQueryName, IDT_QNT2), pszQNT);
      if (!WinLoadString(hab, hmodDLLNational, IDS_CASINO, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s %d", resourceText, Pos);
      if (!WinLoadString(hab, hmodDLLNational, IDS_AFTERRANK, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      sprintf(pszQNT, "%s%s", pszQNT, resourceText);
      WinSetWindowText(WinWindowFromID(hwndQueryName, IDT_QNT3), pszQNT);
      }
   /* Maximale LÑnge der Eingabe auf 99 Zeichen begrenzen */
   WinSendMsg(WinWindowFromID(hwndQueryName, IDE_QN), EM_SETTEXTLIMIT, (MPARAM)99, (MPARAM)0);
   /* Fenster posiitonieren und anzeigen */
   WinSetWindowPos(hwndQueryName, HWND_TOP,
                   (WinQuerySysValue(HWND_DESKTOP, SV_CXSCREEN)-450)/2,
                   (WinQuerySysValue(HWND_DESKTOP, SV_CYSCREEN)-230)/2,
                   450, 230,
                   SWP_SIZE | SWP_MOVE | SWP_ACTIVATE | SWP_SHOW);
   WinProcessDlg(hwndQueryName);
   WinDestroyWindow(hwndQueryName);

   /* Speicher fÅr neuen Eintrag allokieren */
   newEntry = malloc(sizeof(Hscr));
   /* neuen Eintrag mit Daten fÅllen */
   newEntry->Minutes = seconds/60;
   newEntry->Seconds = seconds%60;
   newEntry->Tries = iActualRow+1;
   strcpy(newEntry->Name, Name);
   /* neuen Eintrag vor in Liste hÑngen */
   newEntry->Next = NextPos;
   newEntry->Prev = PrevPos;
   /* mitten in der Kette */
   if ((NextPos != NULL) && (PrevPos != NULL)) {
      PrevPos->Next = newEntry;
      NextPos->Prev = newEntry;
      }
   else {
      /* am Ende der Kette */
      if ((NextPos == NULL) && (PrevPos != NULL))
         PrevPos->Next = newEntry;
      else {
         /* am Anfang der Kette */
         if ((NextPos != NULL) && (PrevPos == NULL)) {
            NextPos->Prev = newEntry;
            Anchor = newEntry;
            }
         else
            /* Kette leer */
            Anchor = newEntry;
         }
      }
   return Anchor;
}

MRESULT EXPENTRY QueryNameDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
/******************************************************/
/* Dialogprozedur fÅr Namensabfrage-Dialog            */
/******************************************************/
{
   static char *Name;
   HWND hwndEntry;
   HWND hwndOK;

   switch(msg)
   {
      case WM_INITDLG:
         Name = PVOIDFROMMP(mp2);
         WinSetPresParam(hwnd, PP_FONTNAMESIZE, (ULONG)sizeof("8.Helv"), (PVOID)"8.Helv");
         if (!WinLoadString(hab, hmodDLLNational, IDS_OKBUTTON, sizeof(resourceText), resourceText))
            error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
         hwndOK = WinCreateWindow(hwnd,
                           WC_BUTTON,
                           resourceText,
                           WS_VISIBLE | BS_PUSHBUTTON | BS_DEFAULT,
                           185, 18,
                           80, 36,
                           hwnd,
                           HWND_TOP,
                           DID_OK,
                           NULL,
                           NULL);
         break;
      case WM_COMMAND:
         /*
          * Entryfield auslesen, Dialog schlie·en
          */
         hwndEntry = WinWindowFromID(hwnd, IDE_QN);
         WinQueryWindowText(hwndEntry, 100, Name);
         WinDismissDlg(hwnd, TRUE);
         break;

      default:
         return(WinDefDlgProc(hwnd, msg, mp1, mp2));
         break;
   }
   return (MRESULT)0;
}

Hscr* ReadHighscore(void)
/******************************************************/
/* sortiert Abgespeicherte Highscore einlesen         */
/******************************************************/
{
   FILE       *HighscoreFile;
   Hscr       *Highscore;
   Hscr       *HighHelp;
   HscrBuffer Buffer;
   int        first;

   HighscoreFile = fopen("mmind.scr", "r");
   if (HighscoreFile != NULL) {
      Highscore = malloc(sizeof(Hscr));
      first = TRUE;
      HighHelp = Highscore;
      while (fread(&Buffer, sizeof(HscrBuffer), 1, HighscoreFile) == 1) {
         if (first != TRUE) {
            HighHelp->Next=malloc(sizeof(Hscr));
            HighHelp->Next->Prev=HighHelp;
            HighHelp = HighHelp->Next;
            }
         else first = FALSE;
         strcpy(HighHelp->Name, Buffer.Name);
         HighHelp->Minutes = Buffer.Minutes;
         HighHelp->Seconds = Buffer.Seconds;
         HighHelp->Tries = Buffer.Tries;
         }
      HighHelp->Next = NULL;
      Highscore->Prev = NULL;
      fclose(HighscoreFile);
      }
   else Highscore = NULL;
   return Highscore;
}

void FreeHighscore(Hscr* Highscore)
/******************************************************/
/* Highscore wieder aus Hauptspeicher entfernen       */
/******************************************************/
{
   FILE       *HighscoreFile;
   Hscr       *HighHelp;
   HscrBuffer Buffer;

   HighHelp = Highscore;
   if (Highscore != NULL)
      if (Highscore->Next != NULL)
         while (HighHelp->Next->Next != NULL)
            HighHelp = HighHelp->Next;
   /* Hilfszeiger jetzt auf vorletztem Element */
   /* Liste von hinten nach vorne lîschen */
   if (HighHelp != NULL)
      if (HighHelp->Next != NULL)
         while (HighHelp != NULL) {
            free(HighHelp->Next);
            HighHelp = HighHelp->Prev;
            }
   /* und noch das erste Element rauswerfen */
   if (Highscore != NULL)
      free(Highscore);
   return;
}

void WriteHighscore(Hscr* Highscore)
/******************************************************/
/* sortiert im RAM Liegende Highscore schreiben       */
/******************************************************/
{
   FILE       *HighscoreFile;
   HscrBuffer Buffer;
   ULONG      retry = MBID_YES;
   int        written = FALSE;
   int        count = 0;
   char       title[30];

   while ((written != TRUE) && (retry == MBID_YES)) {
      HighscoreFile = fopen("mmind.scr", "w");
      if (HighscoreFile != NULL) {
         while ((Highscore != NULL) && (count<10)) {
            count++;
            Buffer.Minutes = Highscore->Minutes;
            Buffer.Seconds = Highscore->Seconds;
            Buffer.Tries = Highscore->Tries;
            strcpy(Buffer.Name, Highscore->Name);
/*            write(HighscoreFile, Buffer.Name, sizeof(char)*100);
            write(HighscoreFile, &Buffer.Tries, sizeof(int));
            write(HighscoreFile, &Buffer.Minutes, sizeof(int));
            write(HighscoreFile, &Buffer.Seconds, sizeof(int));
*/            fwrite(Buffer.Name, sizeof(char), 100, HighscoreFile);
            fwrite(&Buffer.Minutes, sizeof(int), 1, HighscoreFile);
            fwrite(&Buffer.Seconds, sizeof(int), 1, HighscoreFile);
            fwrite(&Buffer.Tries, sizeof(int), 1, HighscoreFile);
            Highscore = Highscore->Next;
            } /* end inner while */
         fclose(HighscoreFile);
         written = TRUE;
         } /* end if */
      else {
         if (!WinLoadString(hab, hmodDLLNational, IDS_OPENERROR, sizeof(resourceText), resourceText))
            error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
         if (!WinLoadString(hab, hmodDLLNational, IDS_ERRORTITLE, sizeof(title), title))
            error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
         retry = WinMessageBox(HWND_DESKTOP,
                    WinWindowFromID(HWND_DESKTOP, ID_MAIN),
                    resourceText,
                    title,
                    DLG_MSGBOX,
                    MB_YESNO | MB_ERROR | MB_MOVEABLE);
      } /* end else */
   } /* end outer while */
   return;
}

void InitHelp(HWND hwnd)
/******************************************************/
/* Routine for initializing the help manager          */
/******************************************************/
{
   HELPINIT hini;
   char     title[50];
   APIRET   rc = NO_ERROR;
   char     *cTemp;
   HWND     hwndMenu;

   HelpEnabled = FALSE;
   /* Initialize help init structure */
   hini.cb = sizeof(HELPINIT);
   hini.ulReturnCode = 0UL;
   /* If tutorial added, add name here */
   hini.pszTutorialName = (PSZ)NULL;
   hini.phtHelpTable = (PHELPTABLE)MAKELONG(MASTERMIND_HELP_TABLE, 0xFFFF);
   hini.hmodHelpTableModule = hmodDLLGlobal;
   hini.hmodAccelActionBarModule = NULLHANDLE;
   hini.idAccelTable = 0;
   hini.idActionBar  = 0;
   if (!WinLoadString(hab, hmodDLLNational, IDS_HELPTITLE, sizeof(resourceText), resourceText))
      error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
   hini.pszHelpWindowTitle = malloc(strlen(resourceText)+1);
   strcpy(hini.pszHelpWindowTitle, resourceText);

   /* Namen der Hilfedatei anhand der aktuellen Sprach-DLL festlegen */
   hini.pszHelpLibraryName = malloc((512+1)*sizeof(CHAR));
   rc = DosQueryModuleName(hmodDLLNational, 512*sizeof(CHAR), hini.pszHelpLibraryName);
   cTemp = strrchr(hini.pszHelpLibraryName, '.');
   strcpy(cTemp, "\0");
   strcat(hini.pszHelpLibraryName, ".HLP");
   /* Creating help instance */
   hwndHelpInstance = WinCreateHelpInstance(hab, &hini);

   if(hwndHelpInstance == NULLHANDLE || hini.ulReturnCode)
   {
      if (!WinLoadString(hab, hmodDLLNational, IDS_HELPERROR, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      if (!WinLoadString(hab, hmodDLLNational, IDS_ERRORTITLE, sizeof(title), title))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      WinMessageBox(HWND_DESKTOP,
                        hwnd,
                        resourceText,
                        title,
                        DLG_MSGBOX,
                        MB_OK | MB_ERROR);
      /* grey out helpmenuitems */
      hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
      WinEnableMenuItem(hwndMenu, IDM_GENERALHELP, FALSE);
      WinEnableMenuItem(hwndMenu, IDM_RULES, FALSE);
      WinEnableMenuItem(hwndMenu, IDM_HOWTOPLAY, FALSE);
      WinEnableMenuItem(hwndMenu, IDM_LICENSE, FALSE);
      /* AufrÑumen */
      free(hini.pszHelpWindowTitle);
      free(hini.pszHelpLibraryName);
      return;
   }

   /* Associate help instance with main frame */
   if(!WinAssociateHelpInstance(hwndHelpInstance, hwnd))
   {
      if (!WinLoadString(hab, hmodDLLNational, IDS_HELPERROR2, sizeof(resourceText), resourceText))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      if (!WinLoadString(hab, hmodDLLNational, IDS_ERRORTITLE, sizeof(title), title))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      WinMessageBox(HWND_DESKTOP,
                        hwnd,
                        resourceText,
                        title,
                        DLG_MSGBOX,
                        MB_OK | MB_ERROR);
      /* grey out helpmenuitems */
      hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
      WinEnableMenuItem(hwndMenu, IDM_GENERALHELP, FALSE);
      WinEnableMenuItem(hwndMenu, IDM_RULES, FALSE);
      WinEnableMenuItem(hwndMenu, IDM_HOWTOPLAY, FALSE);
      WinEnableMenuItem(hwndMenu, IDM_LICENSE, FALSE);
      /* AufrÑumen */
      free(hini.pszHelpWindowTitle);
      free(hini.pszHelpLibraryName);
      return;
   }

   /* activate menuitems */
   hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, QW_PARENT), FID_MENU);
   WinEnableMenuItem(hwndMenu, IDM_GENERALHELP, TRUE);
   WinEnableMenuItem(hwndMenu, IDM_RULES, TRUE);
   WinEnableMenuItem(hwndMenu, IDM_HOWTOPLAY, TRUE);
   WinEnableMenuItem(hwndMenu, IDM_LICENSE, TRUE);

   /* AufrÑumen */
   free(hini.pszHelpWindowTitle);
   free(hini.pszHelpLibraryName);

   /* Help manager is successfully initialized so set flag to TRUE */
   HelpEnabled = TRUE;
   return;
}   /* InitHelp() */

VOID DestroyHelpInstance(VOID)
/******************************************************/
/* Destroys the help instance                         */
/******************************************************/
{
    if(hwndHelpInstance != NULLHANDLE)
    {
       WinDestroyHelpInstance(hwndHelpInstance);
    }
    return;

}

void ReadSettings(void)
/******************************************************/
/* Reads the ini-file                                 */
/******************************************************/
{
   FILE *Settings;
   int iBuffer, i;
   size_t length=0;

   for (i=0; i<6; i++)
      ColorsForUse[i] = i + COLOR_OFFSET;
   Settings = fopen("mmind.ini", "r");
   if (Settings != NULL) {
      if (fread(&iBuffer, sizeof(int), 1, Settings) == 1 )
         Multiple = iBuffer;
      if (fread(&iBuffer, sizeof(size_t), 1, Settings) == 1 ) {
         length = iBuffer;
         Language = malloc(length+1);
         }
      if (length && Language)
         fread(Language, length+1, 1, Settings);
      if (!length && Language) {
         free(Language);
         Language = NULL;
         }
      for(i=0; i<6; i++)
         if(fread(&iBuffer, sizeof(int), 1, Settings) == 1)
            ColorsForUse[i] = iBuffer;
      }
   fclose(Settings);
}

void WriteSettings(void)
/******************************************************/
/* Writes the ini-file                                */
/******************************************************/
{
   FILE *Settings;
   int  Error1 = TRUE, Error2 = TRUE, Error3 = TRUE, Error4 = TRUE;
   ULONG retry = MBID_YES;
   char title[50];
   int length, i;

   while (retry == MBID_YES) {
      Settings = fopen("mmind.ini", "w");
      if (Settings != NULL) {
         /* Multiple colors? */
         if (fwrite(&Multiple, sizeof(int), 1, Settings) == 1) {
            retry = MBID_NO;
            Error1 = FALSE;
            }
         /* Length of Name of Language */
         sprintf(title, "%p", Language);
         sprintf(title, "%i", strlen(Language));
         length = strlen(Language);
         if (fwrite(&length, sizeof(size_t), 1, Settings) == 1) {
            retry = MBID_NO;
            Error2 = FALSE;
            }
         /* Name of Language */
         if (fwrite(Language, length+1, 1, Settings) == 1) {
            retry = MBID_NO;
            Error3 = FALSE;
            }
         /* Selected Colors */
         for (i = 0; i<6; i++)
            if(fwrite(&ColorsForUse[i], sizeof(int), 1, Settings) == 1) {
               retry = MBID_NO;
               Error4 = FALSE;
               }
         fclose(Settings);
         }
      if (Error1 || Error2 || Error3 || Error4)
         {
         if (!WinLoadString(hab, hmodDLLNational, IDS_WRITEINIERROR, sizeof(resourceText), resourceText))
            error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
         if (!WinLoadString(hab, hmodDLLNational, IDS_ERRORTITLE, sizeof(title), title))
            error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
         retry = WinMessageBox(HWND_DESKTOP,
                       WinWindowFromID(HWND_DESKTOP, ID_MAIN),
                       resourceText,
                       title,
                       DLG_MSGBOX,
                       MB_YESNO | MB_ERROR | MB_MOVEABLE);
         }
      }
/*   if (Settings != NULL) fclose(Settings); */
//   fclose(Settings);
}

void error(char *text, int close)
/******************************************************/
/* Display error-message and possibly end program     */
/******************************************************/
{
   char title[50];
   HWND  hwnd;
   DllList *nextDll;

   if (!WinLoadString(hab, hmodDLLNational, IDS_ERRORTITLE, sizeof(title), title)) {
      strcpy(title, "Mastermind/2 error");
/*      WinMessageBox(HWND_DESKTOP,
                       WinWindowFromID(HWND_DESKTOP, ID_MAIN),
                       "Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. I will use English.",
                       title,
                       DLG_MSGBOX,
                       MB_OK | MB_ERROR | MB_MOVEABLE);
*/   }
   hwnd = WinWindowFromID(HWND_DESKTOP, ID_MAIN);
   if (!hwnd) hwnd = HWND_DESKTOP;
   WinMessageBox(HWND_DESKTOP,
                       hwnd,
                       text,
                       title,
                       DLG_MSGBOX,
                       MB_OK | MB_ERROR | MB_MOVEABLE);
   if (close) {
      clearup();
      exit(1);
      }
}

void clearPin(HPS hps, short pos)
/******************************************************/
/* Clears a pin in the actual row                     */
/******************************************************/
{
   RECTL rcl;
   POINTL ptlDrawPosition;

   /* alten Platz lîschen */
   rcl.xLeft = 69 + (37*pos) - 1;
   rcl.yBottom = 107 + (iActualRow * 30) - 1;
   rcl.xRight = rcl.xLeft + 21;
   rcl.yTop = rcl.yBottom + 21;
   WinFillRect(hps, &rcl, CLR_DARKGRAY);
   /* neuen Kreis am alten Platz zeichnen */
   ptlDrawPosition.x = 50 + 18 + 9 + pos*37;
   ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
   GpiSetCurrentPosition(hps, &ptlDrawPosition);
   GpiFullArc(hps, DRO_OUTLINE, MakeFixed(MARKRADIUS,0));
}


void clearDoubleColor(HPS hps, short pos)
/******************************************************/
/* Removes the other pins with same color in same row */
/******************************************************/
{
   int i=0;

   while (i<4)
      {
      if ((GuessedColors[i] == GuessedColors[pos]) && (i!=pos))
         {
         GuessedColors[i] = -1;
         clearPin(hps, i);
         }
      i++;
      }
}


void SetSystemMenu(HWND hwnd)
/******************************************************/
/* Removes the unneccessary items from the systemmenu */
/******************************************************/
{
   HWND hwndSysMenu;
   MENUITEM menuitem;
   SHORT sNumItems;
   SHORT sIndex = 0;
   ULONG ulMenuID;

   hwndSysMenu = WinWindowFromID(hwnd, FID_SYSMENU);
   WinSendMsg(hwndSysMenu, MM_QUERYITEM, MPFROM2SHORT(SC_SYSMENU, FALSE), MPFROMP((PCH)&menuitem));
   sNumItems = SHORT1FROMMR(WinSendMsg(menuitem.hwndSubMenu, MM_QUERYITEMCOUNT, (MPARAM)NULL, (MPARAM)NULL));

   while(sNumItems--)
      {
      ulMenuID = (ULONG) WinSendMsg(menuitem.hwndSubMenu, MM_ITEMIDFROMPOSITION, MPFROM2SHORT(sIndex, TRUE), (MPARAM)NULL);
      switch(SHORT1FROMMP(ulMenuID))
         {
         case SC_MOVE:          /* folgende Menuitems nicht entfernen */
         case SC_CLOSE:
         case SC_MINIMIZE:
         case SC_TASKMANAGER:
            sIndex++;
            break;
         default:
            WinSendMsg(menuitem.hwndSubMenu, MM_DELETEITEM, MPFROM2SHORT(ulMenuID, TRUE), (MPARAM)NULL);
         }
      }
}


int GetLanguageDlls(void)
/******************************************************/
/* Checks for language DLLs and updates the menu      */
/******************************************************/
{
   HDIR hdirFileHandle = HDIR_SYSTEM;
   FILEFINDBUF3 FindBuffer = {0};
   ULONG ulResultBufLen = sizeof(FILEFINDBUF3);
   ULONG ulFindCount = 1;
   APIRET rc = NO_ERROR;
   DllList *anchor;
   UCHAR LoadError[256] = "";            /* Bereich fÅr Ladefehlerinformation */
   UCHAR errmsg[500] = "";               /* Bereich fÅr Ladefehlerinformation */
   HMODULE hmodDLL = NULLHANDLE;
   CHAR LanguageName[50];
   int num=0;
//   int num2=0;
//   int i;
   UCHAR achDirName[256] = "";           /* Buffer for name of directory */
   ULONG cbDirPathLen = 0;               /* size of buffer for directory name */
   ULONG DriveNum = 0;
   ULONG DriveMap = 0;

   /* alle Mastermind-Sprach-DLLs finden und in Liste speichern */
   rc = DosFindFirst("mmind*.dll",
                     &hdirFileHandle,
                     FILE_NORMAL,
                     &FindBuffer,
                     ulResultBufLen,
                     &ulFindCount,
                     FIL_STANDARD);
   if(rc != NO_ERROR)
      return FALSE;

   dllList = malloc(sizeof(DllList));
   anchor = dllList;
   cbDirPathLen = (ULONG) sizeof(achDirName);
   DosQueryCurrentDir(0, achDirName, &cbDirPathLen);
   DosQueryCurrentDisk(&DriveNum, &DriveMap);
   sprintf(dllList->Filename, "%c:\\", 'A' + DriveNum - 1);
   strcat(dllList->Filename, achDirName);
   strcat(dllList->Filename, "\\");
   strcat(dllList->Filename, FindBuffer.achName);
//   error(dllList->Filename, FALSE);
   dllList->Next = NULL;
   dllList->Prev = NULL;
   /* Anzahl mitzÑhlen */
   num++;

   while (rc != ERROR_NO_MORE_FILES) {
      ulFindCount = 1;
      rc = DosFindNext(hdirFileHandle,
                       &FindBuffer,
                       ulResultBufLen,
                       &ulFindCount);
      if (rc == ERROR_NO_MORE_FILES)
         break;
      if (rc != NO_ERROR) {
         error("Could not read language file(s). Program will stop.", TRUE);
         }
      else {
         dllList->Next = malloc(sizeof(DllList));
         dllList->Next->Prev = dllList;
         dllList = dllList->Next;
         DosQueryCurrentDir(0, achDirName, &cbDirPathLen);
         sprintf(dllList->Filename, "%c:\\", 'A' + DriveNum - 1);
         strcat(dllList->Filename, achDirName);
         strcat(dllList->Filename, "\\");
         strcat(dllList->Filename, FindBuffer.achName);
//         error(dllList->Filename, FALSE);
         dllList->Next = NULL;
         /* Anzahl mitzÑhlen */
         num++;
         }
      }
   rc = DosFindClose(hdirFileHandle);


   /* DEBUG */
//   sprintf(errmsg, "Found %i file(s) matching mmind*.dll.", num);
//   error(errmsg, FALSE);
   /* END DEBUG */


   /* Namen der Sprachen lesen und zu Liste hinzufÅgen */
   dllList = anchor;
   while(dllList != NULL) {
      /* DEBUG */
//      num2++;
//      sprintf(errmsg, "Now trying to load number %i: %s", num2, dllList->Filename);
//      error(errmsg, FALSE);
      /* END DEBUG */
      rc = DosLoadModule(LoadError,
                    sizeof(LoadError),
                    dllList->Filename,
                    &hmodDLL);
      /* DEBUG */
//      sprintf(errmsg, "Returncode is %i", rc);
//      if (rc == 0) {
//         strcat(errmsg, ". This means NO ERROR!");
//         }
//      error(errmsg, FALSE);
//      if (rc != NO_ERROR) {
//         sprintf(errmsg, "OS/2 said: %s", LoadError);
//         error(errmsg, FALSE);
//         }
      /* END DEBUG */

      if (!WinLoadString(hab, hmodDLL, IDS_LANGUAGE, sizeof(LanguageName), LanguageName)) {
         sprintf(errmsg, "The file %s seems to be broken. It does not contain information about the language stored in it. Please replace it with a file obtained from the Mastermind/2 homepage (http://www.geocities.com/SiliconValley/Port/4718/).\n\nThe program will end.\n\n", dllList->Filename);
         error(errmsg, TRUE);
         }
      strcpy(dllList->Language, LanguageName);
      /* DEBUG */
//      sprintf(errmsg, "%s loaded successfully. It contains the language %s", dllList->Filename, dllList->Language);
//      error(errmsg, FALSE);
      /* END DEBUG */
      dllList = dllList->Next;
      DosFreeModule(hmodDLL);
      }

   dllList = anchor;
   return TRUE;
}


PSZ GetModuleName(void)
/******************************************************/
/* determins name of module from language name        */
/******************************************************/
{
   int english = FALSE;
   PSZ modName = NULL;
   char errmsg[500];
   DllList *Modules;

   Modules = dllList;

   while (Modules != NULL) {
      /* is dll from the saved settings present? */
      if (Language && !strcmp(Modules->Language, Language)) {
         if (modName)
            free(modName);
         modName = malloc(strlen(Modules->Filename)+1);
         strcpy(modName, Modules->Filename);
         }
      /* do we have an english version? */
      if (!strcmp(Modules->Language, "English"))
         english = TRUE;
      Modules = Modules->Next;
      }
   /* previously saved language is available */
   if (modName)
      return modName;
   /* previously saved language not available, but english is */
   if (!modName && english && Language) {
      sprintf(errmsg, "The previously saved language (%s) was not found. I will use the english version instead. You may change the language in the menu 'Mastermind / Language'.", Language);
      error(errmsg, FALSE);
      Modules = dllList;
      while (Modules != NULL) {
         if (!strcmp(Modules->Language, "English")) {
            if (modName)
               free(modName);
            modName = malloc(strlen(Modules->Filename)+1);
            strcpy(modName, Modules->Filename);
            }
         Modules = Modules->Next;
         }
      if (Language) {
         free(Language);
         Language = NULL;
         }
      Language = malloc(strlen("English")+1);
      strcpy(Language, "English");
      return modName;
      }
   /* no language previously saved, but english is present */
   if (english && !Language) {
      sprintf(errmsg, "No language was previously saved. I will use the english version instead. You may change the language in the menu 'Mastermind / Language'.");
      error(errmsg, FALSE);
      Modules = dllList;
      while (Modules != NULL) {
         if (!strcmp(Modules->Language, "English")) {
            if (modName)
               free(modName);
            modName = malloc(strlen(Modules->Filename)+1);
            strcpy(modName, Modules->Filename);
            }
         Modules = Modules->Next;
         }
      if (Language) {
         free(Language);
         Language = NULL;
         }
      Language = malloc(strlen("English")+1);
      strcpy(Language, "English");
      return modName;
      }
   /* no language previously saved, english not available, but at least one language dll is */
   if (!Language && !english && dllList) {
      sprintf(errmsg, "No language was previously saved and I was not able to find the english version. I will use the first language I found instead (%s). You may change the language in the menu 'Mastermind / Language'.", dllList->Language);
      error(errmsg, FALSE);
      if (modName)
         free(modName);
      modName = malloc(strlen(dllList->Filename)+1);
      strcpy(modName, dllList->Filename);
      if (Language) {
         free(Language);
         Language = NULL;
         }
      Language = malloc(strlen(dllList->Language)+1);
      strcpy(Language, dllList->Language);
      return modName;
      }
   /* previously saved language not available, english not available, but at least one language dll is */
   if (!strlen(modName) && Language && !english && dllList) {
      sprintf(errmsg, "The previously saved language was not found and I was not able to find the english version. I will use the first language I found instead (%s). You may change the language in the menu 'Mastermind / Language'.", dllList->Language);
      error(errmsg, FALSE);
      if (modName)
         free(modName);
      modName = malloc(strlen(dllList->Filename)+1);
      strcpy(modName, dllList->Filename);
      if (Language) {
         free(Language);
         Language = NULL;
         }
      Language = malloc(strlen(dllList->Language)+1);
      strcpy(Language, dllList->Language);
      return modName;
      }
   /* no language dll is available */
   if (!dllList) {
      sprintf(errmsg, "No language was found and the program will be unable to continue. Please obtain at least one language file from the homepage of Mastermind/2 at http://www.geocities.com/SiliconValley/Port/4718/ and start again.");
      error(errmsg, TRUE);
      }
   return NULL;
}


void clearup(void)
/******************************************************/
/* cleans up the memory and exits the program         */
/******************************************************/
{
   DllList *nextDll;

   while(dllList != NULL) {
      nextDll = dllList->Next;
      free(dllList);
      dllList = nextDll;
      }
   if (Language)
      free(Language);
}

void SetLanguageMenu(HWND hwndMenu)
/******************************************************/
/* fill the submenu language with all found languages */
/******************************************************/
{
   short num = 0;
   DllList *Module;
   HWND LanguageMenu;
   MENUITEM item;

   /* Handle des MenÅs fÅr Sprachauswahl herausfinden */
   WinSendMsg(hwndMenu, MM_QUERYITEM, MPFROM2SHORT(IDM_LANGUAGE, TRUE), MPFROMP((PCH)&item));
   LanguageMenu = item.hwndSubMenu;
   /* alle Sprachen als einzelne MenÅpunkte hinzufÅgen */
   Module = dllList;
   while(Module) {
      item.iPosition = num;
      num++;
      item.afStyle = MIS_TEXT;
      item.id = num + IDM_LANGUAGE;
      item.hwndSubMenu = 0;
      item.hItem = 0;
      /* aktuell gewÑhlte Sprache selektieren */
      if (!strcmp(Module->Language, Language))
         item.afAttribute = MIA_CHECKED;
      else
         item.afAttribute = 0;
      WinSendMsg(LanguageMenu, MM_INSERTITEM, (MPARAM)&item, (MPARAM)Module->Language);
      Module = Module->Next;
      }
}


void FillContainer(HWND hwnd, Hscr *Highscore, char *triesTitle, char* nameTitle, char *rankTitle, char *timeTitle)
/******************************************************/
/* fill the container in highscore-dialog             */
/******************************************************/
{
   HWND             hwndCnr = 0L;        /* Handle of ContainerWindow */
   CNRINFO          cnrInfo;             /* ContainerInfo-Struktur */
   PFIELDINFO       pFieldInfo = NULL;
   PFIELDINFO       pField = NULL;
   PFIELDINFO       pFieldNext;
   FIELDINFOINSERT  fii;
   RECORDINSERT     recsIn;
   PCNRITEM         pci, FirstRec;
   Hscr             *hscrAnchor;
   ULONG            num = 0, rank = 1;
   PSZ              HighscoreName = NULL;
   PSZ              HighscoreTime = NULL;
   PSZ              HighscoreTries = NULL;
   PSZ              HighscoreRank = NULL;

   /* save anchor of linked highscore-list */
   hscrAnchor = Highscore;

   /* create container */
   hwndCnr = WinCreateWindow(hwnd,
                             WC_CONTAINER,
                             NULL,
                             WS_VISIBLE | CCS_MINIRECORDCORE | CCS_READONLY,
                             5, 69,         /* x, y */
                             440, 230,      /* Breite, Hîhe */
                             hwnd,
                             HWND_TOP,
                             CID_HIGHSCORE,
                             NULL,
                             NULL);
   /* set detailsview */
   WinSendMsg(hwndCnr, CM_QUERYCNRINFO, MPFROMP(&cnrInfo), MPFROMLONG(sizeof(CNRINFO)));
   cnrInfo.flWindowAttr = CV_DETAIL | CA_DETAILSVIEWTITLES;
   cnrInfo.pszCnrTitle = NULL;
   WinSendMsg(hwndCnr, CM_SETCNRINFO, MPFROMP(&cnrInfo), MPFROMLONG(CMA_FLWINDOWATTR));

   /* create columns */
   pFieldInfo = WinSendMsg(hwndCnr, CM_ALLOCDETAILFIELDINFO, MPFROMSHORT(1), MPFROMLONG(0L));
   if (pFieldInfo != (PFIELDINFO) NULL) {
      pField = pFieldInfo;
      pField->flData = CFA_STRING | CFA_HORZSEPARATOR | CFA_SEPARATOR;
      pField->flTitle = CFA_FITITLEREADONLY | CFA_VCENTER;
      if (!WinLoadString(hab, hmodDLLNational, IDS_HIGHSCORENAME, TITLELENGTH, nameTitle))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      pField->pTitleData = nameTitle;
      pField->offStruct = (ULONG)FIELDOFFSET(CNRITEM, pszName);
      pField->cxWidth = 0;
      pField = pField->pNextFieldInfo;
      fii.cb = sizeof(FIELDINFOINSERT);
      fii.pFieldInfoOrder = (PFIELDINFO)CMA_FIRST;
      fii.fInvalidateFieldInfo = TRUE;
      fii.cFieldInfoInsert = 1;
      WinSendMsg(hwndCnr, CM_INSERTDETAILFIELDINFO, pFieldInfo, &fii);
      }
   pFieldInfo = WinSendMsg(hwndCnr, CM_ALLOCDETAILFIELDINFO, MPFROMSHORT(1), MPFROMLONG(0L));
   if (pFieldInfo != (PFIELDINFO) NULL) {
      pField = pFieldInfo;
      pField->flData = CFA_STRING | CFA_HORZSEPARATOR | CFA_SEPARATOR | CFA_CENTER;
      pField->flTitle = CFA_FITITLEREADONLY | CFA_VCENTER | CFA_CENTER;
      if (!WinLoadString(hab, hmodDLLNational, IDS_HIGHSCORETIME, TITLELENGTH, timeTitle))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      pField->pTitleData = timeTitle;
      pField->offStruct = (ULONG)FIELDOFFSET(CNRITEM, pszTime);
      pField->cxWidth = 0;
      pField = pField->pNextFieldInfo;
      fii.cb = sizeof(FIELDINFOINSERT);
      fii.pFieldInfoOrder = (PFIELDINFO)CMA_FIRST;
      fii.fInvalidateFieldInfo = TRUE;
      fii.cFieldInfoInsert = 1;
      WinSendMsg(hwndCnr, CM_INSERTDETAILFIELDINFO, pFieldInfo, &fii);
      }
   pFieldInfo = WinSendMsg(hwndCnr, CM_ALLOCDETAILFIELDINFO, MPFROMSHORT(1), MPFROMLONG(0L));
   if (pFieldInfo != (PFIELDINFO) NULL) {
      pField = pFieldInfo;
      pField->flData = CFA_ULONG | CFA_HORZSEPARATOR | CFA_SEPARATOR | CFA_CENTER;
      pField->flTitle = CFA_FITITLEREADONLY | CFA_VCENTER | CFA_CENTER;
      if (!WinLoadString(hab, hmodDLLNational, IDS_HIGHSCORETRIES, TITLELENGTH, triesTitle))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      pField->pTitleData = triesTitle;
      pField->offStruct = (ULONG)FIELDOFFSET(CNRITEM, Tries);
      pField->cxWidth = 0;
      pField = pField->pNextFieldInfo;
      fii.cb = sizeof(FIELDINFOINSERT);
      fii.pFieldInfoOrder = (PFIELDINFO)CMA_FIRST;
      fii.fInvalidateFieldInfo = TRUE;
      fii.cFieldInfoInsert = 1;
      WinSendMsg(hwndCnr, CM_INSERTDETAILFIELDINFO, pFieldInfo, &fii);
      }
   pFieldInfo = WinSendMsg(hwndCnr, CM_ALLOCDETAILFIELDINFO, MPFROMSHORT(1), MPFROMLONG(0L));
   if (pFieldInfo != (PFIELDINFO) NULL) {
      pField = pFieldInfo;
      pField->flData = CFA_ULONG | CFA_HORZSEPARATOR | CFA_SEPARATOR | CFA_CENTER;
      pField->flTitle = CFA_FITITLEREADONLY | CFA_VCENTER | CFA_CENTER;
      if (!WinLoadString(hab, hmodDLLNational, IDS_HIGHSCORERANK, TITLELENGTH, rankTitle))
         error("Could not load text in national language. Make sure the file mmind*.dll is up to date and stays in the same directory as mmind.exe. The program will end.", TRUE);
      pField->pTitleData = rankTitle;
      pField->offStruct = (ULONG)FIELDOFFSET(CNRITEM, Rank);
      pField->cxWidth = 0;
      pField = pField->pNextFieldInfo;
      fii.cb = sizeof(FIELDINFOINSERT);
      fii.pFieldInfoOrder = (PFIELDINFO)CMA_FIRST;
      fii.fInvalidateFieldInfo = TRUE;
      fii.cFieldInfoInsert = 1;
      WinSendMsg(hwndCnr, CM_INSERTDETAILFIELDINFO, pFieldInfo, &fii);
      }

   /* Count entries in Highscore */
   while (Highscore) {
      Highscore = Highscore->Next;
      num++;
      }

   /* allocate memory for records */
   pci = (PCNRITEM)WinSendMsg(hwndCnr, CM_ALLOCRECORD, MPFROMLONG(EXTRA_RECORD_BYTES), MPFROMLONG(num));
   /* keep anchor of records */
   FirstRec = pci;

   /* load records with info */
   Highscore = hscrAnchor;
   while (Highscore) {
      pci->Tries = Highscore->Tries;
      pci->Rank = rank++;
      pci->pszName = Highscore->Name;
      pci->pszTime = pci->szTime;
      sprintf(pci->szTime, "%d:%02d", Highscore->Minutes, Highscore->Seconds);
      pci->rc.flRecordAttr = CRA_RECORDREADONLY;
      /* next record */
      Highscore = Highscore->Next;
      pci = (PCNRITEM) pci->rc.preccNextRecord;
      }

   recsIn.cb = sizeof(RECORDINSERT);
   recsIn.pRecordOrder = (PRECORDCORE)CMA_END;
   recsIn.pRecordParent = NULL;
   recsIn.zOrder = (USHORT)CMA_TOP;
   recsIn.fInvalidateRecord = TRUE;
   recsIn.cRecordsInsert = num;

   WinSendMsg(hwndCnr, CM_INSERTRECORD, (PMINIRECORDCORE)FirstRec, &recsIn);

   /* aufrÑumen */
   if (HighscoreName)
      free(HighscoreName);
   if (HighscoreTries)
      free(HighscoreTries);
   if (HighscoreRank)
      free(HighscoreRank);
   if (HighscoreTime)
      free(HighscoreTime);

   return;
}
