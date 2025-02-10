@echo off
@echo  Установщик SUPERSANEK rev. 2.01_02.25 (Feb 2025) запускается.
@echo  Установим:
powershell write-host -BackgroundColor White -ForegroundColor Black Яндекс Браузер
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ZOOM Meetings
powershell write-host -BackgroundColor White -ForegroundColor Black ОПЦИОНАЛЬНО - Автоматическая очистка рабочего стола Лектора раз в 2 недели.
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ОПЦИОНАЛЬНО - Уведомления "Выключите проектор"
mkdir %TEMP%\Install
powershell write-host -BackgroundColor White -ForegroundColor Black --Яндекс
winget install "yandex browser" -s winget
powershell write-host -BackgroundColor Cyan -ForegroundColor White --Zoom Workplace 
winget install "zoom workplace" -s winget
:choiceDEL
set /P c=Удалить использованные установочные файлы?(Y/N)
if /I "%c%" EQU "Y" goto :installDEL
if /I "%c%" EQU "N" goto :choiceCLEANUP
goto :choiceDEL

:installDEl
del /q/f/s %TEMP%\WinGet\*
del /q/f/s %TEMP%\Install\*
powershell write-host -BackgroundColor White -ForegroundColor Black Установочные файлы удалены.
goto :choiceCLEANUP

:choiceCLEANUP
set /P c=Создать задачу для автоматической очистки рабочего стола? Срабатывает каждое воскресенье вечером.(Y/N)
if /I "%c%" EQU "Y" goto :installCLEANUP
if /I "%c%" EQU "N" goto :choicePRJ_NOT
goto :choiceCLEANUP

:installCLEANUP
curl -o C:\PRJ_Notification\CLEANUP_DESKTOP.xml "https://raw.githubusercontent.com/alreedtv/prj_not/main/CLEANUP_DESKTOP.xml"
curl -o C:\PRJ_Notification\cleanup.bat "https://raw.githubusercontent.com/alreedtv/prj_not/main/cleanup.bat"
schtasks /create /xml "C:\PRJ_Notification\CLEANUP_DESKTOP.xml" /tn "CLEANUP_DESKTOP" /ru "%COMPUTERNAME%\Лектор"
goto :choicePRJ_NOT

:choicePRJ_NOT
set /P c=Создать задачу для уведомлений о выключении проектора? Внимание! Работает только с учетной записью с именем "Лектор"!!!(Y/N)
if /I "%c%" EQU "Y" goto :installPRJ
if /I "%c%" EQU "N" goto :terminate
goto :choicePRJ_NOT

:installPRJ
curl -o C:\PRJ_Notification\prj_logo.png "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_logo.png" 
curl -o C:\PRJ_Notification\prj_not.ps1 "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_not.ps1"
curl -o C:\PRJ_Notification\prj_notification.xml "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_not_schd.xml"
curl -o C:\PRJ_Notification\commands_for_powershell.txt "https://raw.githubusercontent.com/alreedtv/prj_not/main/commands_for_powershell.txt"
powershell write-host -BackgroundColor White -ForegroundColor Black Выполните команды из блокнота и закройте его, чтобы продолжить.
notepad.exe "C:\PRJ_Notification\commands_for_powershell.txt"
@pause
schtasks /create /xml "C:\PRJ_Notification\prj_notification.xml" /tn "PRJ_NOT" /ru "%COMPUTERNAME%\Лектор"
powershell write-host -BackgroundColor White -ForegroundColor Black Задача на уведомления установлена. Пожалуйста, отключите автовключение режима "Не беспокоить" в настройках ПК.
goto :terminate

:terminate
powershell write-host -BackgroundColor Yellow -ForegroundColor Black Спасибо, что выбрали ReedTech! Всего доброго!
@pause
exit
