@echo off
@echo  ��⠭��騪 SUPERSANEK rev. 1.92_04.24 (Apr 2024) ��� ��� ����饭.
@echo  �����:
powershell write-host -BackgroundColor White -ForegroundColor Black --7-Zip
powershell write-host -BackgroundColor Yellow -ForegroundColor Black --VLC player
powershell write-host -BackgroundColor Cyan -ForegroundColor Black --LibreOffice
powershell write-host -BackgroundColor White -ForegroundColor Black --OBS Studio
powershell write-host -BackgroundColor Red -ForegroundColor Black --Adobe Acrobat DC
@echo  ����������� - MS Office 365 - ᪠稢���� � Google drive, ��筠� ��⠭����
@echo  ����������� - AnyDesk - ᪠稢���� � Google drive, ��筠� ��⠭����
@echo  ����������� - ������� ��㯯��� ����⨪� ��� Windows 10 (gpedit.msc)
@echo  ����������� - ������� ��㯯��� ����⨪� ��� Windows 11 (gpedit.msc)
@echo  ����������� - ��⮬���᪮� �몫�祭�� � 22-30 (��� ��⪨ ����������� ��� � ��⠭������� �⠭����� ��஫��)
@echo  ����������� - �������� ��⭮� ����� �����
@echo  ����������� - Logitech Camera Settings for BRIO
@echo  ����������� - QOMO Flow!Works ��� ���ࠪ⨢��� ��᮪ � �������ᮢ ASCREEN
@echo  ����������� - Epson iProjection
@echo  ����������� - �������� ��� ��⠫쭮�!
@echo  ����������� - ��⮬���᪮� ���������� ��⠭�������� �ணࠬ�.
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
set /P c=��⠭����� Microsoft 365 (Office) ������?(Y/N)
if /I "%c%" EQU "Y" goto :install_office
if /I "%c%" EQU "N" goto :no_office
goto :choiceAD

:install_office
explorer "https://drive.google.com/file/d/1pkPOaV4d2L8Mhc0kAWm13IPzzgMJ1q7X/view?usp=drive_link"
goto :choiceAD
:no_office
goto :choiceAD

:choiceAD
set /P c=��⠭����� Anydesk v.7.0 ������?(Y/N)
if /I "%c%" EQU "Y" goto :installAD
if /I "%c%" EQU "N" goto :choice
goto :choiceAD

:installAD
explorer "https://drive.google.com/file/d/1o3QcKRi8VrEOuwBd3NmhWWGiVYobMZ0k/view?usp=sharing"
goto :choice 

:choice
set /P c=��⠭����� ।���� ��㯯���� ����⨪ gpedit.msc ��� Windows 10?(Y/N)
if /I "%c%" EQU "Y" goto :installGP
if /I "%c%" EQU "N" goto :no_installGP
goto :choice

:installGP
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭�������� ।���� ��㯯���� ����⨪... ��������, ��������.
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >find-gpedit.txt
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>find-gpedit.txt
for /f %%i in ('findstr /i . find-gpedit.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"
@echo ������� ��㯯���� ����⨪ ��⠭�����.
goto :choice11

:no_installGP
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭���� ।���� ��㯯���� ����⨪ �⬥����.
goto :choice11

:choice11
set /P c=��⠭����� ।���� ��㯯���� ����⨪ gpedit.msc ��� Windows 11?(Y/N)
if /I "%c%" EQU "Y" goto :installGP11
if /I "%c%" EQU "N" goto :no_installGP11
goto :choice11

:installGP11
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
powershell write-host -BackgroundColor White -ForegroundColor Black ������� ��㯯���� ����⨪ ��� Windows 11 ��⠭�����.
goto :choice_secpol

:no_installGP11
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭���� ।���� ��㯯���� ����⨪ ��� Windows 11 �⬥����.
goto :choice_secpol

:choice_secpol
set /P c=������ ।���� ��㯯���� ����⨪ � ������� ����⨪� ������᭮��?(Y/N)
if /I "%c%" EQU "Y" goto :secpol
if /I "%c%" EQU "N" goto :choiceSHUTDOWN
goto :choice_secpol

:secpol
powershell write-host -BackgroundColor Blue -ForegroundColor White �������� ����⨪ ���뢠����...
start gpedit.msc
start secpol.msc
goto :choiceSHUTDOWN


:choiceSHUTDOWN
powershell write-host -BackgroundColor Red -ForegroundColor White ��������! ��� ���������� ���� ������ �� ����� ����� ������ �������������� ��� �� ����������� �������!
set /P c=��⠭����� ��⮬���᪮� �몫�祭�� � 22-30?(Y/N)
if /I "%c%" EQU "Y" goto :installSHUTDOWN
if /I "%c%" EQU "N" goto :no_installSHUTDOWN
goto :choiceSHUTDOWN

:installSHUTDOWN
schtasks /create /ru "����������� ���" /rp FsO28821 /sc daily /tn PlannedShutdown_22-30 /tr "shutdown -s -t 300" /st 22:30 /np /rl HIGHEST
powershell write-host -BackgroundColor White -ForegroundColor Black ��⮬���᪮� �몫�祭�� ��⠭������.
goto :choice_Lector

:no_installSHUTDOWN
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭���� ��⮬���᪮�� �몫�祭�� �⬥����.
goto :choice_Lector

:choice_Lector
powershell write-host -BackgroundColor Red -ForegroundColor White ��������! ��� ������� ������� �������������� ������� ������ ��� �������!
set /P c=������� ����� ������ �����?(Y/N)
if /I "%c%" EQU "Y" goto :LectorCreate
if /I "%c%" EQU "N" goto :LectorNoCreate
goto :choice_Lector

:LectorCreate
net user ����� /add
echo ��⭠� ������ ����� ᮧ����.
goto :choice1

:LectorNoCreate
echo �⪠���� � ᮧ����� ��⭮� �����. ���室 � ᫥���饩 �ணࠬ��.
goto :choice1
 
:choice1
set /P c=��⠭����� �⨫��� ��� ����ன�� ���-������ Logitech BRIO?(Y/N)
if /I "%c%" EQU "Y" goto :installLGS
if /I "%c%" EQU "N" goto :no_installLGS
goto :choice1


:installLGS
winget install "Logitech Camera Settings" -v 2.12.8.0
powershell write-host -BackgroundColor White -ForegroundColor Black �ਫ������ ��� Logitech BRIO ��⠭������
goto :choice2

:no_installLGS
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭���� �ਫ������ ��� Logitech BRIO �⬥����.
goto :choice2

:choice2
set /P c=��⠭����� QOMO Flow!Works? �ணࠬ�� ᪠砥� 䠩� ��⠭���� � ������� ���, ����� ᠬ�.(Y/N)
if /I "%c%" EQU "Y" goto :installQFW
if /I "%c%" EQU "N" goto :no_installQFW
goto :choice2

:installQFW
curl http://www.qomo-products.ru/downloads/driver/FlowWorks_3.1.1.20151126.zip -o %TEMP%\Install\FlowWorks.zip
powershell -command "Expand-Archive -Force '%TEMP%\Install\FlowWorks.zip' '%TEMP%\Install\FlowWorks'"
start %TEMP%\Install\FlowWorks\Flow!Works.exe
powershell write-host -BackgroundColor White -ForegroundColor Black QOMO Flow!Works ��⠭������
goto :choiceEWP

:no_installQFW
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭���� Flow!Works �⬥����
goto :choiceEWP

:choiceEWP
set /P c=��⠭����� Epson iProjection? �ணࠬ�� ᪠砥� 䠩� ��⠭���� � ������� ���, ����� ᠬ�.(Y/N)
if /I "%c%" EQU "Y" goto :installEWP
if /I "%c%" EQU "N" goto :no_installEWP
goto :choiceEWP

:installEWP
curl https://ftp.epson.com/drivers/iProj_3.34.exe -o %TEMP%\Install\iProjection.exe
start %TEMP%\Install\iProjection.exe
powershell write-host -BackgroundColor White -ForegroundColor Black Epson iProjection ��⠭������
goto :choiceUPD

:no_installEWP
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭���� Epson iProjection �⬥����
goto :choiceUPD

:choiceUPD
set /P c=�������� �� ��⠫�� ����㯭� �ணࠬ�� �� ��᫥���� ���ᨨ?(Y/N)
if /I "%c%" EQU "Y" goto :installUPD
if /I "%c%" EQU "N" goto :no_installUPD
goto :choiceUPD

:installUPD
winget upgrade --all
powershell write-host -BackgroundColor White -ForegroundColor Black �� ����㯭� ���������� ��⠭������.
goto :choiceAUTOUPD

:no_installUPD
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭���� ���������� �⪫����� ���짮��⥫��. ����� �������...
goto :choiceAUTOUPD

:choiceAUTOUPD
powershell write-host -BackgroundColor Red -ForegroundColor White ��������! ��� ���������� ���� ������ �� ����� ����� ������ �������������� ��� �� ����������� �������!
set /P c=��⠭����� ��⮬���᪮� ���������� �ணࠬ�?(Y/N)
if /I "%c%" EQU "Y" goto :installAUTOUPD
if /I "%c%" EQU "N" goto :no_installAUTOUPD
goto :choiceAUTOUPD

:installAUTOUPD
schtasks /create /ru "����������� ���" /rp FsO28821 /sc daily /tn ScheduledUPD_ALL /tr "winget update --all" /st 22:15 /np /rl HIGHEST
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭������ ���������� ���������� �ணࠬ�.
goto :choice_PRJ_NOT

:no_installAUTOUPD
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭���� ��⮬���᪮�� ���������� �⬥����.
goto :choice_PRJ_NOT

:choice_PRJ_NOT
set /P c=����㧨�� 䠩�� ��� 㢥�������� � ����室����� �몫���� �஥��� � ���� ����? ����ன�� ������ ���� �ந������� ������ � ��⭮� ����� �����.(Y/N)
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
powershell write-host -BackgroundColor White -ForegroundColor Black ���稢���� 㢥�������� � �몫�祭�� �஥��� �⬥����.
goto :choiceDEL

:choiceDEL
set /P c=������� �ᯮ�짮����� ��⠭����� 䠩��?(Y/N)
if /I "%c%" EQU "Y" goto :installDEL
if /I "%c%" EQU "N" goto :terminate
goto :choiceDEL

:installDEl
del /q/f/s %TEMP%\WinGet\*
del /q/f/s %TEMP%\Install\*
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭����� 䠩�� 㤠����. �����襭�� �ணࠬ��...
goto :terminate


:terminate
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ���ᨡ�, �� ��ࠫ� ReedTech! �ᥣ� ���ண�!
@pause
exit
