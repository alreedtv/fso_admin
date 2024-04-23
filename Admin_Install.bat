@echo off
@echo  Установщик SUPERSANEK rev. 1.92_04.24 (Apr 2024) для ОПС запущен.
@echo  Пакет:
powershell write-host -BackgroundColor White -ForegroundColor Black --7-Zip
powershell write-host -BackgroundColor Yellow -ForegroundColor Black --VLC player
powershell write-host -BackgroundColor Cyan -ForegroundColor Black --LibreOffice
powershell write-host -BackgroundColor White -ForegroundColor Black --OBS Studio
powershell write-host -BackgroundColor Red -ForegroundColor Black --Adobe Acrobat DC
@echo  ОПЦИОНАЛЬНО - MS Office 365 - скачивание с Google drive, ручная установка
@echo  ОПЦИОНАЛЬНО - AnyDesk - скачивание с Google drive, ручная установка
@echo  ОПЦИОНАЛЬНО - Локальные групповые политики для Windows 10 (gpedit.msc)
@echo  ОПЦИОНАЛЬНО - Локальные групповые политики для Windows 11 (gpedit.msc)
@echo  ОПЦИОНАЛЬНО - Автоматическое выключение в 22-30 (для учетки Администратор ОПС с установленным стандартным паролем)
@echo  ОПЦИОНАЛЬНО - Создание учетной записи Лектора
@echo  ОПЦИОНАЛЬНО - Logitech Camera Settings for BRIO
@echo  ОПЦИОНАЛЬНО - QOMO Flow!Works для интерактивных досок и комплексов ASCREEN
@echo  ОПЦИОНАЛЬНО - Epson iProjection
@echo  ОПЦИОНАЛЬНО - Обновить всё остальное!
@echo  ОПЦИОНАЛЬНО - Автоматическое обновление установленных программ.
@pause
mkdir %TEMP%\Install
powershell write-host -BackgroundColor White -ForegroundColor Black --7-Zip
winget install 7-Zip
powershell write-host -BackgroundColor Yellow -ForegroundColor Black --VLC player
winget upgrade "VLC media player"
winget install "VLC media player"
winget uninstall TeamViewer -e
powershell write-host -BackgroundColor Cyan -ForegroundColor Black --LibreOffice
winget uninstall OpenOffice
winget install LibreOffice -e -v 7.5.0.3
powershell write-host -BackgroundColor White -ForegroundColor Black --OBS Studio
winget install "OBS Studio" -s winget
powershell write-host -BackgroundColor Red -ForegroundColor Black --Adobe Acrobat DC
winget install "Adobe Acrobat Reader DC (64-bit)"

:choice_office
set /P c=Установить Microsoft 365 (Office) вручную?(Y/N)
if /I "%c%" EQU "Y" goto :install_office
if /I "%c%" EQU "N" goto :no_office
goto :choiceAD

:install_office
explorer "https://drive.google.com/file/d/1pkPOaV4d2L8Mhc0kAWm13IPzzgMJ1q7X/view?usp=drive_link"
goto :choiceAD
:no_office
goto :choiceAD

:choiceAD
set /P c=Установить Anydesk v.7.0 вручную?(Y/N)
if /I "%c%" EQU "Y" goto :installAD
if /I "%c%" EQU "N" goto :choice
goto :choiceAD

:installAD
explorer "https://drive.google.com/file/d/1o3QcKRi8VrEOuwBd3NmhWWGiVYobMZ0k/view?usp=sharing"
goto :choice 

:choice
set /P c=Установить редактор групповых политик gpedit.msc для Windows 10?(Y/N)
if /I "%c%" EQU "Y" goto :installGP
if /I "%c%" EQU "N" goto :no_installGP
goto :choice

:installGP
powershell write-host -BackgroundColor White -ForegroundColor Black Устанавливаем редактор групповых политик... Пожалуйста, подождите.
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >find-gpedit.txt
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>find-gpedit.txt
for /f %%i in ('findstr /i . find-gpedit.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"
@echo Редактор групповых политик установлен.
goto :choice11

:no_installGP
powershell write-host -BackgroundColor White -ForegroundColor Black Установка редактора групповых политик отменена.
goto :choice11

:choice11
set /P c=Установить редактор групповых политик gpedit.msc для Windows 11?(Y/N)
if /I "%c%" EQU "Y" goto :installGP11
if /I "%c%" EQU "N" goto :no_installGP11
goto :choice11

:installGP11
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
powershell write-host -BackgroundColor White -ForegroundColor Black Редактор групповых политик для Windows 11 установлен.
goto :choice_secpol

:no_installGP11
powershell write-host -BackgroundColor White -ForegroundColor Black Установка редактора групповых политик для Windows 11 отменена.
goto :choice_secpol

:choice_secpol
set /P c=Открыть редактор групповых политик и локальные политики безопасности?(Y/N)
if /I "%c%" EQU "Y" goto :secpol
if /I "%c%" EQU "N" goto :choiceSHUTDOWN
goto :choice_secpol

:secpol
powershell write-host -BackgroundColor Blue -ForegroundColor White Редакторы политик открываются...
start gpedit.msc
start secpol.msc
goto :choiceSHUTDOWN


:choiceSHUTDOWN
powershell write-host -BackgroundColor Red -ForegroundColor White ВНИМАНИЕ! ДЛЯ ВЫПОЛНЕНИЯ ЭТОЙ ЗАДАЧИ НА КОМПЕ НУЖНА УЧЕТКА АДМИНИСТРАТОРА ОПС СО СТАНДАРТНЫМ ПАРОЛЕМ!
set /P c=Установить автоматическое выключение в 22-30?(Y/N)
if /I "%c%" EQU "Y" goto :installSHUTDOWN
if /I "%c%" EQU "N" goto :no_installSHUTDOWN
goto :choiceSHUTDOWN

:installSHUTDOWN
schtasks /create /ru "Администратор ОПС" /rp FsO28821 /sc daily /tn PlannedShutdown_22-30 /tr "shutdown -s -t 300" /st 22:30 /np /rl HIGHEST
powershell write-host -BackgroundColor White -ForegroundColor Black Автоматическое выключение установлено.
goto :choice_Lector

:no_installSHUTDOWN
powershell write-host -BackgroundColor White -ForegroundColor Black Установка автоматического выключения отменена.
goto :choice_Lector

:choice_Lector
powershell write-host -BackgroundColor Red -ForegroundColor White ВНИМАНИЕ! ЭТА КОМАНДА СОЗДАЕТ ДОПОЛНИТЕЛЬНУЮ УЧЕТНУЮ ЗАПИСЬ ДЛЯ ЛЕКТОРА!
set /P c=Создать учетную запись Лектора?(Y/N)
if /I "%c%" EQU "Y" goto :LectorCreate
if /I "%c%" EQU "N" goto :LectorNoCreate
goto :choice_Lector

:LectorCreate
net user Лектор /add
echo Учетная запись лектора создана.
goto :choice1

:LectorNoCreate
echo Отказано в создании учетной записи. Переход к следующей программе.
goto :choice1
 
:choice1
set /P c=Установить утилиту для настройки веб-камеры Logitech BRIO?(Y/N)
if /I "%c%" EQU "Y" goto :installLGS
if /I "%c%" EQU "N" goto :no_installLGS
goto :choice1


:installLGS
winget install "Logitech Camera Settings" -v 2.12.8.0
powershell write-host -BackgroundColor White -ForegroundColor Black Приложение для Logitech BRIO установлено
goto :choice2

:no_installLGS
powershell write-host -BackgroundColor White -ForegroundColor Black Установка приложения для Logitech BRIO отменена.
goto :choice2

:choice2
set /P c=Установить QOMO Flow!Works? Программа скачает файл установки и запустит его, дальше сами.(Y/N)
if /I "%c%" EQU "Y" goto :installQFW
if /I "%c%" EQU "N" goto :no_installQFW
goto :choice2

:installQFW
curl http://www.qomo-products.ru/downloads/driver/FlowWorks_3.1.1.20151126.zip -o %TEMP%\Install\FlowWorks.zip
powershell -command "Expand-Archive -Force '%TEMP%\Install\FlowWorks.zip' '%TEMP%\Install\FlowWorks'"
start %TEMP%\Install\FlowWorks\Flow!Works.exe
powershell write-host -BackgroundColor White -ForegroundColor Black QOMO Flow!Works установлена
goto :choiceEWP

:no_installQFW
powershell write-host -BackgroundColor White -ForegroundColor Black Установка Flow!Works отменена
goto :choiceEWP

:choiceEWP
set /P c=Установить Epson iProjection? Программа скачает файл установки и запустит его, дальше сами.(Y/N)
if /I "%c%" EQU "Y" goto :installEWP
if /I "%c%" EQU "N" goto :no_installEWP
goto :choiceEWP

:installEWP
curl https://ftp.epson.com/drivers/iProj_3.34.exe -o %TEMP%\Install\iProjection.exe
start %TEMP%\Install\iProjection.exe
powershell write-host -BackgroundColor White -ForegroundColor Black Epson iProjection установлена
goto :choiceUPD

:no_installEWP
powershell write-host -BackgroundColor White -ForegroundColor Black Установка Epson iProjection отменена
goto :choiceUPD

:choiceUPD
set /P c=Обновить все остальные доступные программы до последней версии?(Y/N)
if /I "%c%" EQU "Y" goto :installUPD
if /I "%c%" EQU "N" goto :no_installUPD
goto :choiceUPD

:installUPD
winget upgrade --all
powershell write-host -BackgroundColor White -ForegroundColor Black Все доступные обновления установлены.
goto :choiceAUTOUPD

:no_installUPD
powershell write-host -BackgroundColor White -ForegroundColor Black Установка обновлений отклонена пользователем. Какая жалость...
goto :choiceAUTOUPD

:choiceAUTOUPD
powershell write-host -BackgroundColor Red -ForegroundColor White ВНИМАНИЕ! ДЛЯ ВЫПОЛНЕНИЯ ЭТОЙ ЗАДАЧИ НА КОМПЕ НУЖНА УЧЕТКА АДМИНИСТРАТОРА ОПС СО СТАНДАРТНЫМ ПАРОЛЕМ!
set /P c=Установить автоматическое обновление программ?(Y/N)
if /I "%c%" EQU "Y" goto :installAUTOUPD
if /I "%c%" EQU "N" goto :no_installAUTOUPD
goto :choiceAUTOUPD

:installAUTOUPD
schtasks /create /ru "Администратор ОПС" /rp FsO28821 /sc daily /tn ScheduledUPD_ALL /tr "winget update --all" /st 22:15 /np /rl HIGHEST
powershell write-host -BackgroundColor White -ForegroundColor Black Установлено ежедневное обновление программ.
goto :choice_PRJ_NOT

:no_installAUTOUPD
powershell write-host -BackgroundColor White -ForegroundColor Black Установка автоматического обновления отменена.
goto :choice_PRJ_NOT

:choice_PRJ_NOT
set /P c=Загрузить файлы для уведомления о необходимости выключить проектор в конце пары? Настройка должна быть произведена вручную с учетной записи Лектора.(Y/N)
if /I "%c%" EQU "Y" goto :installPRJ
if /I "%c%" EQU "N" goto :no_installPRJ
goto :choice_PRJ_NOT

:installPRJ
mkdir C:\PRJ_Notification
curl -o C:\PRJ_Notification\wallpaper.png "https://raw.githubusercontent.com/alreedtv/prj_not/main/wallpaper.png"
curl -o C:\PRJ_Notification\prj_logo.png "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_logo.png" 
curl -o C:\PRJ_Notification\prj_not.ps1 "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_not.ps1"
curl -o C:\PRJ_Notification\prj_notification.xml "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_not_schd.xml"
curl -o C:\PRJ_Notification\commands_for_powershell.txt "https://raw.githubusercontent.com/alreedtv/prj_not/main/commands_for_powershell.txt"
notepad.exe "C:\PRJ_Notification\commands_for_powershell.txt"
goto :choiceDEL

:no_installPRJ
powershell write-host -BackgroundColor White -ForegroundColor Black Скачивание уведомлений о выключении проектора отменено.
goto :choiceDEL

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
