@echo off
@echo  ��⠭��騪 SUPERSANEK rev. 1.95_01.25 (Jan 2025) ����᪠����.
@echo  ��⠭����:
powershell write-host -BackgroundColor White -ForegroundColor Black ������ ��㧥�
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ZOOM Meetings
@pause
mkdir %TEMP%\Install
powershell write-host -BackgroundColor White -ForegroundColor Black --������
winget install Yandex -s winget
powershell write-host -BackgroundColor Cyan -ForegroundColor White --Zoom Workplace 
winget install "zoom workplace" -s winget
:choiceDEL
set /P c=������� �ᯮ�짮����� ��⠭����� 䠩��?(Y/N)
if /I "%c%" EQU "Y" goto :installDEL
if /I "%c%" EQU "N" goto :terminate
goto :choiceDEL

:installDEl
del /q/f/s %TEMP%\WinGet\*
del /q/f/s %TEMP%\Install\*
powershell write-host -BackgroundColor White -ForegroundColor Black ��⠭����� 䠩�� 㤠����.
goto :terminate


:terminate
powershell write-host -BackgroundColor Yellow -ForegroundColor Black ���ᨡ�, �� ��ࠫ� ReedTech! �ᥣ� ���ண�!
@pause
exit
