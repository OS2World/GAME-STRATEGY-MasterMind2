/******************************/
/* Mastermind/2 Installation  */
/* January 1999               */
/* version 1.4                */
/* R. Auberger                */
/******************************/

/* laden der Rexx-Util Funktionen */
call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs

/* suchen aller verfgbaren Spachen */
rc = SysFileTree('mmind*.nlv', sprache, 'FO')

if sprache.0 = 0 then Do
   say   
   say "You need at least one language module!"
   say "Language modules may be obtained from the Mastermind/2 homepage:"
   say "http://www.geocities.com/SiliconValley/Port/4718/"
   say
   say "Installation ended unsuccessful."
   exit
end /* do */

/* laden der Namen der Sprachen */
nlv.0 = sprache.0
do i = 1 to sprache.0
   nlv.i = linein(sprache.i)
end /* do */

Sprachauswahl:
call titel
say
do i = 1 to sprache.0
   say " " || i || ") " || nlv.i
end /* do */
say
say

Pull nummer
if datatype(nummer, 'W') \= 1 then signal Sprachauswahl

/* if datatype(eingabe, 'W')=1 then
   nummer = c2d(eingabe)
else
   signal Sprachauswahl
*/

if (nummer > sprache.0) | (nummer <= 0) then signal Sprachauswahl

punkt = lastpos('.', sprache.nummer)
help = left(sprache.nummer, punkt) || 'hlp'
usersguide = linein(sprache.nummer)
readme = linein(sprache.nummer)
thema = linein(sprache.nummer)

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
if \SysCreateObject("WPProgram", usersguide, "<MASTERMIND2>", "EXENAME=view.exe;PARAMETERS="||help||" "||thema, "u") then Signal fehler
Say '  ...User''s Guide for Mastermind/2:  ok'
if \SysCreateObject("WPProgram", readme, "<MASTERMIND2>", "EXENAME=e.exe;PARAMETERS="||fullname||"Readme", "u") then Signal fehler
Say '  ...Readme for Mastermind/2:        ok'

Say
Say 'Now launching the user''s guide.'
'@view.exe '||help||' '||thema

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
