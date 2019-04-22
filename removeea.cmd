/* Entfernen aller erweiterten Attribute von den Bitmaps */
/* M„rz 1999, R. Auberger */

call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs

rc = SysFileTree('*.bmp', bitmap, 'FO')

say 'L”sche Verzeichnis "eas"...'
'@del eas /N'

Say 'Entferne erweiterte Attribute von '||bitmap.0||' Bitmaps...'
do i=1 to bitmap.0
        '@eautil '||bitmap.i||' /s'
end

rc = SysFileTree('*.ptr', pointer, 'FO')

Say 'Entferne erweiterte Attribute von '||pointer.0||' Zeigern...'
do i=1 to pointer.0
        '@eautil '||pointer.i||' /s'
end

say 'Fertig!'
exit

