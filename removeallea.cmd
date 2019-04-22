/* Entfernen aller erweiterten Attribute von den Bitmaps */
/* M„rz 1999, R. Auberger */

call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs

rc = SysFileTree('*', bitmap, 'FO')

say 'L”sche Verzeichnis "eas"...'
'@del eas /N'

Say 'Entferne erweiterte Attribute von '||bitmap.0||' Dateien...'
do i=1 to bitmap.0
        '@eautil '||bitmap.i||' /s'
end

say 'Fertig!'
exit

