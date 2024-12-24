@echo off
@echo  “áâ ­®¢é¨ª SUPERSANEK rev. 1.92_04.24 (Apr 2024) ¤«ï Ž‘ § ¯ãé¥­.
@echo   ª¥â:
powershell write-host -BackgroundColor White -ForegroundColor Black Ÿ­¤¥ªá à ã§¥à
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ZOOM Meetings
@pause
mkdir %TEMP%\Install
powershell write-host -BackgroundColor White -ForegroundColor Black --Ÿ­¤¥ªá à ã§¥à
winget install Yandex -s winget
powershell write-host -BackgroundColor Cyan -ForegroundColor White --Zoom Workplace 
winget install "zoom workplace" -s winget
:choiceDEL
set /P c=“¤ «¨âì ¨á¯®«ì§®¢ ­­ë¥ ãáâ ­®¢®ç­ë¥ ä ©«ë?(Y/N)
if /I "%c%" EQU "Y" goto :installDEL
if /I "%c%" EQU "N" goto :terminate
goto :choiceDEL

:installDEl
del /q/f/s %TEMP%\WinGet\*
del /q/f/s %TEMP%\Install\*
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­®¢®ç­ë¥ ä ©«ë ã¤ «¥­ë. ‡ ¢¥àè¥­¨¥ ¯à®£à ¬¬ë...
goto :terminate


:terminate
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ‘¯ á¨¡®, çâ® ¢ë¡à «¨ ReedTech! ‚á¥£® ¤®¡à®£®!
@pause
exit
