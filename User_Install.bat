@echo off
@echo  Установщик SUPERSANEK rev. 1.92_04.24 (Apr 2024) для ОПС запущен.
@echo  Пакет:
powershell write-host -BackgroundColor White -ForegroundColor Black Яндекс Браузер
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ZOOM Meetings
@pause
mkdir %TEMP%\Install
powershell write-host -BackgroundColor White -ForegroundColor Black --Яндекс Браузер
winget install "Yandex Browser" -s winget
powershell write-host -BackgroundColor Cyan -ForegroundColor White --Zoom Workplace 
winget install "zoom workplace" -s winget
:choiceDEL
set /P c=Удалить использованные установочные файлы?(Y/N)
if /I "%c%" EQU "Y" goto :installDEL
if /I "%c%" EQU "N" goto :terminate
goto :choiceDEL

:installDEl
del /q/f/s %TEMP%\WinGet\*
del /q/f/s %TEMP%\Install\*
powershell write-host -BackgroundColor White -ForegroundColor Black Установочные файлы удалены. Завершение программы...
goto :terminate


:terminate
powershell write-host -BackgroundColor Yellow -ForegroundColor Black Спасибо, что выбрали ReedTech! Всего доброго!
@pause
exit
