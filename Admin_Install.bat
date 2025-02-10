@echo off
@echo  Установщик SUPERSANEK rev. 2.01_02.25 (Feb 2025) для ОПС запущен.
@echo  Пакет:
powershell write-host -BackgroundColor White -ForegroundColor Black --7-Zip
powershell write-host -BackgroundColor Yellow -ForegroundColor Black --VLC player
powershell write-host -BackgroundColor Cyan -ForegroundColor Black --LibreOffice
powershell write-host -BackgroundColor White -ForegroundColor Black --OBS Studio
powershell write-host -BackgroundColor Red -ForegroundColor Black --Adobe Acrobat DC
@echo  ОПЦИОНАЛЬНО - MS Office 365
@echo  ОПЦИОНАЛЬНО - AnyDesk, автоматическая загрузка, ручная установка
@echo  ОПЦИОНАЛЬНО - Локальные групповые политики для Windows 10 (gpedit.msc)
@echo  ОПЦИОНАЛЬНО - Локальные групповые политики для Windows 11 (gpedit.msc)
@echo  ОПЦИОНАЛЬНО - Автоматическая установка типовых локальных параметров безопасности и локальных групповых политик
@echo  ОПЦИОНАЛЬНО - Автоматическое выключение в 22-30 (для учетки Администратор ОПС с установленным стандартным паролем)
@echo  ОПЦИОНАЛЬНО - Создание учетной записи Лектора
@echo  ОПЦИОНАЛЬНО - Logitech Camera Settings for BRIO
@echo  ОПЦИОНАЛЬНО - QOMO Flow!Works для интерактивных досок и комплексов ASCREEN
@echo  ОПЦИОНАЛЬНО - Epson iProjection
@echo  ОПЦИОНАЛЬНО - Обновить всё остальное!
@echo  ОПЦИОНАЛЬНО - Автоматическое обновление установленных программ.
@echo  ОПЦИОНАЛЬНО - Загрузка сетевой заставки рабочего стола и уведомлений о необходимости выключить проектор.
@pause
mkdir %TEMP%\Install
mkdir C:\PRJ_Notification
curl -o C:\PRJ_Notification\WLPP_Update.bat "https://raw.githubusercontent.com/alreedtv/prj_not/main/WLLPP_Update.bat" 
curl -o C:\PRJ_Notification\wallpaper.png "https://raw.githubusercontent.com/alreedtv/prj_not/main/wallpaper.png"
@echo Файл wallpaper.png загружен.
schtasks /create /ru "Администратор ОПС" /rp FsO28821 /sc daily /tn ScheduledWLPPR_UPD /tr "C:\PRJ_Notification\WLLPP_Update.bat" /st 22:25 /np /rl HIGHEST
powershell write-host -BackgroundColor White -ForegroundColor Black Установлено ежедневное обновление обоев. Необходима донастройка в редакторе групповых политик.
curl -o %TEMP%\Install\OfficeSetup.zip "https://raw.githubusercontent.com/alreedtv/fso_admin/main/OfficeSetup.zip"
curl -o %TEMP%\Install\LGPO.zip "https://raw.githubusercontent.com/alreedtv/fso_admin/main/LGPO.zip"
powershell write-host -BackgroundColor White -ForegroundColor Black --7-Zip
winget install 7-Zip
powershell write-host -BackgroundColor Yellow -ForegroundColor Black --VLC player
winget upgrade "VLC media player"
winget install "VLC media player"
winget uninstall TeamViewer -e
powershell write-host -BackgroundColor Cyan -ForegroundColor Black --LibreOffice
winget uninstall OpenOffice
powershell write-host -BackgroundColor White -ForegroundColor Black --OBS Studio
winget install "OBS Studio" -s winget
powershell write-host -BackgroundColor Red -ForegroundColor Black --Adobe Acrobat DC
winget install "Adobe Acrobat Reader DC"
cd "C:\Program Files\7-Zip"
7z x %TEMP%\Install\OfficeSetup.zip -o"%TEMP%\Install"
7z x %TEMP%\Install\LGPO.zip -o"%TEMP%\Install"


:choice_office
set /P c=Установить Microsoft 365 (Office)?(Y/N)
if /I "%c%" EQU "Y" goto :install_office
if /I "%c%" EQU "N" goto :no_office
goto :choiceAD

:install_office
cd "C:\Program Files\7-Zip"
start %TEMP%\Install\OfficeSetup\OfficeSetup.exe
goto :choiceAD
:no_office
goto :choiceAD

:choiceAD
set /P c=Установить Anydesk v.7.0 вручную?(Y/N)
if /I "%c%" EQU "Y" goto :installAD
if /I "%c%" EQU "N" goto :choice
goto :choiceAD

:installAD
start %TEMP%\Install\OfficeSetup\AnyDesk.exe
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
set /P c=Установить типовые групповые политики и локальные политики безопасности ОПС?(Y/N)
if /I "%c%" EQU "Y" goto :secpol
if /I "%c%" EQU "N" goto :choiceSHUTDOWN
goto :choice_secpol

:secpol
powershell write-host -BackgroundColor Blue -ForegroundColor White Импортируем типовые политики...
cd %temp%\Install\LGPO
powershell .\LGPO.exe /g %TEMP%\Install\LGPO
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
echo Учетная запись лектора создана. Пожалуйста, отключите срок действия пароля и возможность его установки.
start lusrmgr.msc
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
goto :choiceDEL

:no_installAUTOUPD
powershell write-host -BackgroundColor White -ForegroundColor Black Установка автоматического обновления отменена.
goto :choiceDEL

:choiceDEL
set /P c=Удалить использованные установочные файлы? Не удаляйте для успешной донастройки ПК в учетной записи Лектора. Их можно будет удалить после донастройки.(Y/N)
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
