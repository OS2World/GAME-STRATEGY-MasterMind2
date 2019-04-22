/*********************************************************************
 *                                                                   *
 * MODULE NAME :  common.c               AUTHOR:  Rick Fishman       *
 * DATE WRITTEN:  10-09-92                                           *
 *                                                                   *
 * DESCRIPTION:                                                      *
 *                                                                   *
 *  This module is part of address.EXE. It contains common functions *
 *  used by all modules in the EXE.                                  *
 *                                                                   *
 * CALLABLE FUNCTIONS:                                               *
 *                                                                   *
 *  VOID SetWindowTitle( HWND hwndClient, PSZ szFormat, ... );       *
 *  VOID Msg           ( PSZ szFormat, ... );                        *
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

#define  INCL_WINFRAMEMGR
#define  INCL_WINSTDCNR
#define  INCL_WINWINDOWMGR
#define  INCL_WIN
#define INCL_GPI

/**********************************************************************/
/*----------------------------- INCLUDES -----------------------------*/
/**********************************************************************/

#include <os2.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "address.h"

/*********************************************************************/
/*------------------- APPLICATION DEFINITIONS -----------------------*/
/*********************************************************************/

/**********************************************************************/
/*---------------------------- STRUCTURES ----------------------------*/
/**********************************************************************/

/**********************************************************************/
/*----------------------- FUNCTION PROTOTYPES ------------------------*/
/**********************************************************************/

/**********************************************************************/
/*------------------------ GLOBAL VARIABLES --------------------------*/
/**********************************************************************/

/**********************************************************************/
/*-------------------------- SetWindowTitle --------------------------*/
/*                                                                    */
/*  SET THE FRAME WINDOW'S TITLEBAR TEXT.                             */
/*                                                                    */
/*  INPUT: client window handle,                                      */
/*         a message in printf format with its parms                  */
/*                                                                    */
/*  1. Format the message using vsprintf.                             */
/*  2. Set the text into the titlebar.                                */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/

#define TITLEBAR_TEXTLEN (CCHMAXPATH + 50)

VOID SetWindowTitle( HWND hwndClient, PSZ szFormat,... )
{
    PSZ     szMsg;
    va_list argptr;

    if( (szMsg = (PSZ) malloc( TITLEBAR_TEXTLEN )) == NULL )
    {
        DosBeep( 1000, 1000 );

        return;
    }

    va_start( argptr, szFormat );

    vsprintf( szMsg, szFormat, argptr );

    va_end( argptr );

    szMsg[ TITLEBAR_TEXTLEN - 1 ] = 0;

    (void) WinSetWindowText( PARENT( hwndClient ), szMsg );

    free( szMsg );
}

/**********************************************************************/
/*------------------------------- Msg --------------------------------*/
/*                                                                    */
/*  DISPLAY A MESSAGE TO THE USER.                                    */
/*                                                                    */
/*  INPUT: a message in printf format with its parms                  */
/*                                                                    */
/*  1. Format the message using vsprintf.                             */
/*  2. Sound a warning sound.                                         */
/*  3. Display the message in a message box.                          */
/*                                                                    */
/*  OUTPUT: nothing                                                   */
/*                                                                    */
/*--------------------------------------------------------------------*/
/**********************************************************************/

#define MESSAGE_SIZE 1024

VOID Msg( PSZ szFormat,... )
{
    PSZ     szMsg;
    va_list argptr;

    if( (szMsg = (PSZ) malloc( MESSAGE_SIZE )) == NULL )
    {
        DosBeep( 1000, 1000 );

        return;
    }

    va_start( argptr, szFormat );

    vsprintf( szMsg, szFormat, argptr );

    va_end( argptr );

    szMsg[ MESSAGE_SIZE - 1 ] = 0;

    (void) WinAlarm( HWND_DESKTOP, WA_WARNING );

    (void) WinMessageBox(  HWND_DESKTOP, HWND_DESKTOP, szMsg,
                           PROGRAM_TITLE, 1, MB_OK | MB_MOVEABLE );

    free( szMsg );
}

/*********************************************************************
   Message in die Trace Listbox schreiben
**********************************************************************/
VOID WriteTrace ( PINIDATA pini, CHAR Msg [ 255 ] )
        {
        WinSendMsg( hwndTrace, LM_SETTOPINDEX, (MPARAM) WinSendMsg ( hwndTrace,
                 LM_INSERTITEM, (MPARAM) LIT_END, MPFROMP (Msg) ), NULL );
        return;
        }

/*********************************************************************
   Messagebox senden mit der Åbergebenen Message
**********************************************************************/
USHORT MsgBoxSenden( PINIDATA pini, CHAR Msg [255] )
      {
      USHORT usResponse;
      // Message-Box anzeigen
      usResponse =  WinMessageBox (HWND_DESKTOP,
             hwndClient,
             Msg,
             "",
             0,
             MB_OKCANCEL);
      return usResponse;
      }

/******************************************************
 change colors for background and forground
 ******************************************************/
VOID ChangeColor(HWND hwnd, BYTE ared, BYTE agreen, BYTE ablue,
   BYTE bred, BYTE bgreen, BYTE bblue,
   BYTE cred, BYTE cgreen, BYTE cblue)
   {
   RGB2         rgb2;

   // Set RGB values for Background color
   rgb2.bRed = ared;     // Found these in 'WinSetSysColors' API
   rgb2.bGreen = agreen;
   rgb2.bBlue = ablue;
   rgb2.fcOptions = 0 ;
   // Set background color
   WinSetPresParam (hwnd, PP_BACKGROUNDCOLOR, (ULONG) sizeof (RGB2),
                    &rgb2) ;
   // Set RGB values for forground
   rgb2.bRed = bred;
   rgb2.bGreen = bgreen;
   rgb2.bBlue = bblue;
   rgb2.fcOptions = 0 ;
   // Set text foreground color
   WinSetPresParam (hwnd, PP_FOREGROUNDCOLOR, (ULONG) sizeof (RGB2),
                    &rgb2) ;
   // Set text border color (important for outline fonts)
   rgb2.bRed = cred;
   rgb2.bGreen = cgreen;
   rgb2.bBlue = cblue;
   rgb2.fcOptions = 0 ;
   WinSetPresParam (hwnd, PP_BORDERCOLOR, (ULONG) sizeof (RGB2), &rgb2) ;
   return;
   }
/*************************************************************************
 *                     E N D     O F     S O U R C E                     *
 *************************************************************************/
