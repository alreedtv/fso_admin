@echo off
@echo  ��⠭��騪 SUPERSANEK rev. 2.01_02.25 (Feb 2025) ����᪠����.
@echo  ��⠭����:
powershell write-host -BackgroundColor White -ForegroundColor Black ������ ��㧥�
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ZOOM Meetings
powershell write-host -BackgroundColor White -ForegroundColor Black ����������� - ��⮬���᪠� ���⪠ ࠡ�祣� �⮫� ����� ࠧ � 2 ������.
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ����������� - ����������� "�몫��� �஥���"
mkdir %TEMP%\Install
powershell write-host -BackgroundColor White -ForegroundColor Black --������
winget install "yandex browser" -s winget
powershell write-host -BackgroundColor Cyan -ForegroundColor White --Zoom Workplace 
winget install "zoom workplace" -s winget
:choiceDEL
set /P c=������� �ᯮ�짮����� ��⠭����� 䠩��?(Y/N)
if /I "%c%" EQU "Y" goto :installDEL
if /I "%c%" EQU "N" goto :choiceCLEANUP
goto :choiceDEL

:installDEl
del /q/f/s %TEMP%\WinGet\*
del /q/f/s %TEMP%\Install\*
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭����� 䠩�� 㤠����.
goto :choiceCLEANUP

:choiceCLEANUP
set /P c=������� ������ ��� ��⮬���᪮� ���⪨ ࠡ�祣� �⮫�? �ࠡ��뢠�� ������ ����ᥭ� ���஬.(Y/N)
if /I "%c%" EQU "Y" goto :installCLEANUP
if /I "%c%" EQU "N" goto :choicePRJ_NOT
goto :choiceCLEANUP

:installCLEANUP
curl -o C:\PRJ_Notification\CLEANUP_DESKTOP.xml "https://raw.githubusercontent.com/alreedtv/prj_not/main/CLEANUP_DESKTOP.xml"
curl -o C:\PRJ_Notification\cleanup.bat "https://raw.githubusercontent.com/alreedtv/prj_not/main/cleanup.bat"
schtasks /create /xml "C:\PRJ_Notification\CLEANUP_DESKTOP.xml" /tn "CLEANUP_DESKTOP" /ru "%COMPUTERNAME%\�����"
goto :choicePRJ_NOT

:choicePRJ_NOT
set /P c=������� ������ ��� 㢥�������� � �몫�祭�� �஥���? ��������! ����⠥� ⮫쪮 � ��⭮� ������� � ������ "�����"!!!(Y/N)
if /I "%c%" EQU "Y" goto :installPRJ
if /I "%c%" EQU "N" goto :terminate
goto :choicePRJ_NOT

:installPRJ
curl -o C:\PRJ_Notification\prj_logo.png "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_logo.png" 
curl -o C:\PRJ_Notification\prj_not.ps1 "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_not.ps1"
curl -o C:\PRJ_Notification\prj_notification.xml "https://raw.githubusercontent.com/alreedtv/prj_not/main/prj_not_schd.xml"
curl -o C:\PRJ_Notification\commands_for_powershell.txt "https://raw.githubusercontent.com/alreedtv/prj_not/main/commands_for_powershell.txt"
powershell write-host -BackgroundColor White -ForegroundColor Black �믮���� ������� �� ������� � ���ன� ���, �⮡� �த������.
notepad.exe "C:\PRJ_Notification\commands_for_powershell.txt"
@pause
schtasks /create /xml "C:\PRJ_Notification\prj_notification.xml" /tn "PRJ_NOT" /ru "%COMPUTERNAME%\�����"
powershell write-host -BackgroundColor White -ForegroundColor Black ����� �� 㢥�������� ��⠭������. ��������, �⪫��� ��⮢���祭�� ०��� "�� ��ᯮ�����" � ����ன��� ��.
goto :terminate

:terminate
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ���ᨡ�, �� ��ࠫ� ReedTech! �ᥣ� ���ண�!
@pause
exit
