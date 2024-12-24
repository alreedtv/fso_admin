@echo off
@echo  “áâ ­®¢é¨ª SUPERSANEK rev. 1.93_12.24 (Dec 2024) ¤«ï Ž‘ § ¯ãé¥­.
@echo   ª¥â:
powershell write-host -BackgroundColor White -ForegroundColor Black --7-Zip
powershell write-host -BackgroundColor Yellow -ForegroundColor Black --VLC player
powershell write-host -BackgroundColor Cyan -ForegroundColor Black --LibreOffice
powershell write-host -BackgroundColor White -ForegroundColor Black --OBS Studio
powershell write-host -BackgroundColor Red -ForegroundColor Black --Adobe Acrobat DC
@echo  Ž–ˆŽ€‹œŽ - MS Office 365 - áª ç¨¢ ­¨¥ á Google drive, àãç­ ï ãáâ ­®¢ª 
@echo  Ž–ˆŽ€‹œŽ - AnyDesk - áª ç¨¢ ­¨¥ á Google drive, àãç­ ï ãáâ ­®¢ª 
@echo  Ž–ˆŽ€‹œŽ - ‹®ª «ì­ë¥ £àã¯¯®¢ë¥ ¯®«¨â¨ª¨ ¤«ï Windows 10 (gpedit.msc)
@echo  Ž–ˆŽ€‹œŽ - ‹®ª «ì­ë¥ £àã¯¯®¢ë¥ ¯®«¨â¨ª¨ ¤«ï Windows 11 (gpedit.msc)
@echo  Ž–ˆŽ€‹œŽ - €¢â®¬ â¨ç¥áª®¥ ¢ëª«îç¥­¨¥ ¢ 22-30 (¤«ï ãç¥âª¨ €¤¬¨­¨áâà â®à Ž‘ á ãáâ ­®¢«¥­­ë¬ áâ ­¤ àâ­ë¬ ¯ à®«¥¬)
@echo  Ž–ˆŽ€‹œŽ - ‘®§¤ ­¨¥ ãç¥â­®© § ¯¨á¨ ‹¥ªâ®à 
@echo  Ž–ˆŽ€‹œŽ - Logitech Camera Settings for BRIO
@echo  Ž–ˆŽ€‹œŽ - QOMO Flow!Works ¤«ï ¨­â¥à ªâ¨¢­ëå ¤®á®ª ¨ ª®¬¯«¥ªá®¢ ASCREEN
@echo  Ž–ˆŽ€‹œŽ - Epson iProjection
@echo  Ž–ˆŽ€‹œŽ - Ž¡­®¢¨âì ¢áñ ®áâ «ì­®¥!
@echo  Ž–ˆŽ€‹œŽ - €¢â®¬ â¨ç¥áª®¥ ®¡­®¢«¥­¨¥ ãáâ ­®¢«¥­­ëå ¯à®£à ¬¬.
@pause
mkdir %TEMP%\Install
mkdir C:\PRJ_Notification
curl -o C:\PRJ_Notification\wallpaper.png "https://raw.githubusercontent.com/alreedtv/prj_not/main/wallpaper.png"
schtasks /create /ru "€¤¬¨­¨áâà â®à Ž‘" /rp FsO28821 /sc daily /tn ScheduledWLPPR_UPD /tr "winget update --all" /st 22:25 /np /rl HIGHEST
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
set /P c=“áâ ­®¢¨âì Microsoft 365 (Office) ¢àãç­ãî?(Y/N)
if /I "%c%" EQU "Y" goto :install_office
if /I "%c%" EQU "N" goto :no_office
goto :choiceAD

:install_office
explorer "https://drive.google.com/file/d/1pkPOaV4d2L8Mhc0kAWm13IPzzgMJ1q7X/view?usp=drive_link"
goto :choiceAD
:no_office
goto :choiceAD

:choiceAD
set /P c=“áâ ­®¢¨âì Anydesk v.7.0 ¢àãç­ãî?(Y/N)
if /I "%c%" EQU "Y" goto :installAD
if /I "%c%" EQU "N" goto :choice
goto :choiceAD

:installAD
explorer "https://drive.google.com/file/d/1o3QcKRi8VrEOuwBd3NmhWWGiVYobMZ0k/view?usp=sharing"
goto :choice 

:choice
set /P c=“áâ ­®¢¨âì à¥¤ ªâ®à £àã¯¯®¢ëå ¯®«¨â¨ª gpedit.msc ¤«ï Windows 10?(Y/N)
if /I "%c%" EQU "Y" goto :installGP
if /I "%c%" EQU "N" goto :no_installGP
goto :choice

:installGP
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­ ¢«¨¢ ¥¬ à¥¤ ªâ®à £àã¯¯®¢ëå ¯®«¨â¨ª... ®¦ «ã©áâ , ¯®¤®¦¤¨â¥.
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >find-gpedit.txt
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>find-gpedit.txt
for /f %%i in ('findstr /i . find-gpedit.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"
@echo ¥¤ ªâ®à £àã¯¯®¢ëå ¯®«¨â¨ª ãáâ ­®¢«¥­.
goto :choice11

:no_installGP
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­®¢ª  à¥¤ ªâ®à  £àã¯¯®¢ëå ¯®«¨â¨ª ®â¬¥­¥­ .
goto :choice11

:choice11
set /P c=“áâ ­®¢¨âì à¥¤ ªâ®à £àã¯¯®¢ëå ¯®«¨â¨ª gpedit.msc ¤«ï Windows 11?(Y/N)
if /I "%c%" EQU "Y" goto :installGP11
if /I "%c%" EQU "N" goto :no_installGP11
goto :choice11

:installGP11
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
powershell write-host -BackgroundColor White -ForegroundColor Black ¥¤ ªâ®à £àã¯¯®¢ëå ¯®«¨â¨ª ¤«ï Windows 11 ãáâ ­®¢«¥­.
goto :choice_secpol

:no_installGP11
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­®¢ª  à¥¤ ªâ®à  £àã¯¯®¢ëå ¯®«¨â¨ª ¤«ï Windows 11 ®â¬¥­¥­ .
goto :choice_secpol

:choice_secpol
set /P c=Žâªàëâì à¥¤ ªâ®à £àã¯¯®¢ëå ¯®«¨â¨ª ¨ «®ª «ì­ë¥ ¯®«¨â¨ª¨ ¡¥§®¯ á­®áâ¨?(Y/N)
if /I "%c%" EQU "Y" goto :secpol
if /I "%c%" EQU "N" goto :choiceSHUTDOWN
goto :choice_secpol

:secpol
powershell write-host -BackgroundColor Blue -ForegroundColor White ¥¤ ªâ®àë ¯®«¨â¨ª ®âªàë¢ îâáï...
start gpedit.msc
start secpol.msc
start lusrmgr.msc
goto :choiceSHUTDOWN


:choiceSHUTDOWN
powershell write-host -BackgroundColor Red -ForegroundColor White ‚ˆŒ€ˆ…! „‹Ÿ ‚›Ž‹…ˆŸ ’Ž‰ ‡€„€—ˆ € ŠŽŒ… “†€ “—…’Š€ €„Œˆˆ‘’€’Ž€ Ž‘ ‘Ž ‘’€„€’›Œ €Ž‹…Œ!
set /P c=“áâ ­®¢¨âì  ¢â®¬ â¨ç¥áª®¥ ¢ëª«îç¥­¨¥ ¢ 22-30?(Y/N)
if /I "%c%" EQU "Y" goto :installSHUTDOWN
if /I "%c%" EQU "N" goto :no_installSHUTDOWN
goto :choiceSHUTDOWN

:installSHUTDOWN
schtasks /create /ru "€¤¬¨­¨áâà â®à Ž‘" /rp FsO28821 /sc daily /tn PlannedShutdown_22-30 /tr "shutdown -s -t 300" /st 22:30 /np /rl HIGHEST
powershell write-host -BackgroundColor White -ForegroundColor Black €¢â®¬ â¨ç¥áª®¥ ¢ëª«îç¥­¨¥ ãáâ ­®¢«¥­®.
goto :choice_Lector

:no_installSHUTDOWN
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­®¢ª   ¢â®¬ â¨ç¥áª®£® ¢ëª«îç¥­¨ï ®â¬¥­¥­ .
goto :choice_Lector

:choice_Lector
powershell write-host -BackgroundColor Red -ForegroundColor White ‚ˆŒ€ˆ…! ’€ ŠŽŒ€„€ ‘Ž‡„€…’ „ŽŽ‹ˆ’…‹œ“ž “—…’“ž ‡€ˆ‘œ „‹Ÿ ‹…Š’Ž€!
set /P c=‘®§¤ âì ãç¥â­ãî § ¯¨áì ‹¥ªâ®à ?(Y/N)
if /I "%c%" EQU "Y" goto :LectorCreate
if /I "%c%" EQU "N" goto :LectorNoCreate
goto :choice_Lector

:LectorCreate
net user ‹¥ªâ®à /add
echo “ç¥â­ ï § ¯¨áì «¥ªâ®à  á®§¤ ­ .
goto :choice1

:LectorNoCreate
echo Žâª § ­® ¢ á®§¤ ­¨¨ ãç¥â­®© § ¯¨á¨. ¥à¥å®¤ ª á«¥¤ãîé¥© ¯à®£à ¬¬¥.
goto :choice1
 
:choice1
set /P c=“áâ ­®¢¨âì ãâ¨«¨âã ¤«ï ­ áâà®©ª¨ ¢¥¡-ª ¬¥àë Logitech BRIO?(Y/N)
if /I "%c%" EQU "Y" goto :installLGS
if /I "%c%" EQU "N" goto :no_installLGS
goto :choice1


:installLGS
winget install "Logitech Camera Settings" -v 2.12.8.0
powershell write-host -BackgroundColor White -ForegroundColor Black à¨«®¦¥­¨¥ ¤«ï Logitech BRIO ãáâ ­®¢«¥­®
goto :choice2

:no_installLGS
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­®¢ª  ¯à¨«®¦¥­¨ï ¤«ï Logitech BRIO ®â¬¥­¥­ .
goto :choice2

:choice2
set /P c=“áâ ­®¢¨âì QOMO Flow!Works? à®£à ¬¬  áª ç ¥â ä ©« ãáâ ­®¢ª¨ ¨ § ¯ãáâ¨â ¥£®, ¤ «ìè¥ á ¬¨.(Y/N)
if /I "%c%" EQU "Y" goto :installQFW
if /I "%c%" EQU "N" goto :no_installQFW
goto :choice2

:installQFW
curl http://www.qomo-products.ru/downloads/driver/FlowWorks_3.1.1.20151126.zip -o %TEMP%\Install\FlowWorks.zip
powershell -command "Expand-Archive -Force '%TEMP%\Install\FlowWorks.zip' '%TEMP%\Install\FlowWorks'"
start %TEMP%\Install\FlowWorks\Flow!Works.exe
powershell write-host -BackgroundColor White -ForegroundColor Black QOMO Flow!Works ãáâ ­®¢«¥­ 
goto :choiceEWP

:no_installQFW
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­®¢ª  Flow!Works ®â¬¥­¥­ 
goto :choiceEWP

:choiceEWP
set /P c=“áâ ­®¢¨âì Epson iProjection? à®£à ¬¬  áª ç ¥â ä ©« ãáâ ­®¢ª¨ ¨ § ¯ãáâ¨â ¥£®, ¤ «ìè¥ á ¬¨.(Y/N)
if /I "%c%" EQU "Y" goto :installEWP
if /I "%c%" EQU "N" goto :no_installEWP
goto :choiceEWP

:installEWP
curl https://ftp.epson.com/drivers/iProj_3.34.exe -o %TEMP%\Install\iProjection.exe
start %TEMP%\Install\iProjection.exe
powershell write-host -BackgroundColor White -ForegroundColor Black Epson iProjection ãáâ ­®¢«¥­ 
goto :choiceUPD

:no_installEWP
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­®¢ª  Epson iProjection ®â¬¥­¥­ 
goto :choiceUPD

:choiceUPD
set /P c=Ž¡­®¢¨âì ¢á¥ ®áâ «ì­ë¥ ¤®áâã¯­ë¥ ¯à®£à ¬¬ë ¤® ¯®á«¥¤­¥© ¢¥àá¨¨?(Y/N)
if /I "%c%" EQU "Y" goto :installUPD
if /I "%c%" EQU "N" goto :no_installUPD
goto :choiceUPD

:installUPD
winget upgrade --all
powershell write-host -BackgroundColor White -ForegroundColor Black ‚á¥ ¤®áâã¯­ë¥ ®¡­®¢«¥­¨ï ãáâ ­®¢«¥­ë.
goto :choiceAUTOUPD

:no_installUPD
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­®¢ª  ®¡­®¢«¥­¨© ®âª«®­¥­  ¯®«ì§®¢ â¥«¥¬. Š ª ï ¦ «®áâì...
goto :choiceAUTOUPD

:choiceAUTOUPD
powershell write-host -BackgroundColor Red -ForegroundColor White ‚ˆŒ€ˆ…! „‹Ÿ ‚›Ž‹…ˆŸ ’Ž‰ ‡€„€—ˆ € ŠŽŒ… “†€ “—…’Š€ €„Œˆˆ‘’€’Ž€ Ž‘ ‘Ž ‘’€„€’›Œ €Ž‹…Œ!
set /P c=“áâ ­®¢¨âì  ¢â®¬ â¨ç¥áª®¥ ®¡­®¢«¥­¨¥ ¯à®£à ¬¬?(Y/N)
if /I "%c%" EQU "Y" goto :installAUTOUPD
if /I "%c%" EQU "N" goto :no_installAUTOUPD
goto :choiceAUTOUPD

:installAUTOUPD
schtasks /create /ru "€¤¬¨­¨áâà â®à Ž‘" /rp FsO28821 /sc daily /tn ScheduledUPD_ALL /tr "winget update --all" /st 22:15 /np /rl HIGHEST
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­®¢«¥­® ¥¦¥¤­¥¢­®¥ ®¡­®¢«¥­¨¥ ¯à®£à ¬¬.
goto :choice_PRJ_NOT

:no_installAUTOUPD
powershell write-host -BackgroundColor White -ForegroundColor Black “áâ ­®¢ª   ¢â®¬ â¨ç¥áª®£® ®¡­®¢«¥­¨ï ®â¬¥­¥­ .
goto :choice_PRJ_NOT

:choice_PRJ_NOT
set /P c=‡ £àã§¨âì ä ©«ë ¤«ï ã¢¥¤®¬«¥­¨ï ® ­¥®¡å®¤¨¬®áâ¨ ¢ëª«îç¨âì ¯à®¥ªâ®à ¢ ª®­æ¥ ¯ àë?  áâà®©ª  ¤®«¦­  ¡ëâì ¯à®¨§¢¥¤¥­  ¢àãç­ãî á ãç¥â­®© § ¯¨á¨ ‹¥ªâ®à .(Y/N)
if /I "%c%" EQU "Y" goto :installPRJ
if /I "%c%" EQU "N" goto :no_installPRJ
goto :choice_PRJ_NOT

:installPRJ
mkdir C:\PRJ_Notification
curl -o C:\PRJ_Notification\prj_logo.png "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_logo.png" 
curl -o C:\PRJ_Notification\prj_not.ps1 "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_not.ps1"
curl -o C:\PRJ_Notification\prj_notification.xml "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_not_schd.xml"
curl -o C:\PRJ_Notification\commands_for_powershell.txt "https://raw.githubusercontent.com/alreedtv/prj_not/main/commands_for_powershell.txt"
notepad.exe "C:\PRJ_Notification\commands_for_powershell.txt"
goto :choiceDEL

:no_installPRJ
powershell write-host -BackgroundColor White -ForegroundColor Black ‘ª ç¨¢ ­¨¥ ã¢¥¤®¬«¥­¨© ® ¢ëª«îç¥­¨¨ ¯à®¥ªâ®à  ®â¬¥­¥­®.
goto :choiceDEL

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
