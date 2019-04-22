/******************************/
/* Mastermind/2 Installation  */
/* January 1999               */
/* version 1.0                */
/* R. Auberger                */
/******************************/

/* laden der Rexx-Util Funktionen */
call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs

/* Programmobjekt anlegen */
call titel
verz = Directory()
fullname = verz ||'\'
Say 'Now creating objects on your desktop.'
Say
if \SysCreateObject("WPFolder", "Mastermind/2", "<WP_DESKTOP>", "OBJECTID=<MASTERMIND2>", "u") then Signal fehler
Say '  ...Folder for Mastermind/2:        ok'
if \SysCreateObject("WPProgram", "Mastermind/2", "<MASTERMIND2>", "EXENAME="||fullname||"mmind.exe;ICON=mmind.ico", "u") then Signal fehler
Say '  ...Programobject for Mastermind/2: ok'
if \SysCreateObject("WPProgram", "User's Guide", "<MASTERMIND2>", "EXENAME=view.exe;PARAMETERS="||fullname||"mmind.hlp welcome", "u") then Signal fehler
Say '  ...User''s Guide for Mastermind/2:  ok'
if \SysCreateObject("WPProgram", "Readme", "<MASTERMIND2>", "EXENAME=e.exe;PARAMETERS="||fullname||"Readme", "u") then Signal fehler
Say '  ...Readme for Mastermind/2:        ok'

Say
Say 'Now launching the user''s guide.'
'@view.exe mmind.hlp welcome'

Say
Say
Say 'Installation complete.'
Say 'Thank you for using Mastermind/2! Have fun!'
exit

titel:
call SysCls
Say
Say '******************************'
Say '* Mastermind/2 Installation  *'
Say '******************************'
Say
Say
Say
return

fehler:
Say
Say 'Error:'
Say 'Could not create WPS objects.'
exit
