@ECHO OFF
SETLOCAL
for /f %%i in ("%0") do set curpath=%%~dpi 
cd /d %curpath% 
set "progroot=C:\Program Files (x86)\"
if not exist "C:\Program Files (x86)" SET "progroot=C:\Program Files\"

set restroot=%progroot%The Neverhood Restoration Project
set dreamworksroot=%progroot%DreamWorks Interactive
set nevroot=%dreamworksroot%\Neverhood
if exist C:\setup95.exe del C:\setup95.exe /f

REM If Julia still exists, remove the folder. No good. 
if exist "%progroot%The Neverhood Restoration Project Julia\unins000.exe" ( 
	"%progroot%The Neverhood Restoration Project Julia\unins000.exe"
)

rem Remove the Neverhood in its entirety.
if %PROCESSOR_ARCHITECTURE%==x86 ( 
	reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\DreamWorks Interactive" && reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\DreamWorks Interactive" /f
) else ( 
	if %PROCESSOR_ARCHITECTURE%==AMD64 ( 
		reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\DreamWorks Interactive" && reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\DreamWorks Interactive" /f
	) else (
		reg query "HKEY_LOCAL_MACHINE\SOFTWARE\DreamWorks Interactive" && "HKEY_LOCAL_MACHINE\SOFTWARE\DreamWorks Interactive" /f
)) 
if exist "%dreamworksroot%" echo y | rmdir /S /Q "%dreamworksroot%"

rem Begin transmission from disc.
mkdir "%dreamworksroot%"
mkdir "%nevroot%"
if not exist NEVERHOOD_CONTENT mkdir "NEVERHOOD_CONTENT"
sdbinst.exe theneverhoodfix.sdb

for %%D in (A,B,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z) do (
	if exist %%D:\NUL ( 
		dir %%D: 1>NUL 2>NUL && (
			if exist %%D:\setup95.exe (
				echo MSGBOX "Hey. Thank you for purchasing the Neverhood. That is, if you're not using an burned ISO/exploitation." > %temp%\TEMPmessage.vbs
				call %temp%\TEMPmessage.vbs
				del %temp%\TEMPmessage.vbs /f /q
				START %%D:\setup95.exe
				goto file_check
			)
		)
	)
)

echo MSGBOX "A folder named NEVERHOOD_CONTENT has been generated outside of the file. Please check the folder by which you ran setup.jar in. Copy the content of the Neverhood into the NEVERHOOD_CONTENT directory. Now checking for files in NEVERHOOD_CONTENT folder." > %temp%\TEMPmessage.vbs
call %temp%\TEMPmessage.vbs
del %temp%\TEMPmessage.vbs /f /q

rem They don't have a disc. Oh no, piracy!
:superman
for %%f in (setup
			DATA
			setup95.exe
			nhood.ico) do if not exist "NEVERHOOD_CONTENT\%%f" (
	ping 127.0.0.1 -n 1 -w 1000 > output
	goto superman
   )
echo MSGBOX "Pyroneous did not distribute the Neverhood illicitly to you. Remember that the only legal way to run the Neverhood is to buy it. We will still permit you to install the everhood, but we are not responsible for your actions. You can read our full purposes at theneverhood.sourceforge.net. Thanks!" > %temp%\TEMPmessage.vbs
call %temp%\TEMPmessage.vbs
del %temp%\TEMPmessage.vbs /f 
START NEVERHOOD_CONTENT\setup95.exe

rem Begin checking for files.
:file_check
if exist "%nevroot%\nhc.exe" (goto file_exists) else (timeout /t 1 /nobreak > output)
goto file_check

:file_exists
copy /Y "%~dp0version.txt" "%nevroot%"
copy /Y "%~dp0prettyversion.txt" "%nevroot%"
copy /Y "%~dp0run.bat" "%nevroot%" 

:checkfiles
for %%f in (nhc.exe 
            readme.txt 
            HD.BLB 
            smackw32.dll 
            setup95.exe 
           ) do if not exist "%nevroot%\%%f" (
    ping 127.0.0.1 -n 1 -w 1000 > output
    goto checkfiles
   )

rem Kill setup. 
taskkill.exe /F /IM setup95.exe /T

rem Generate shortcut. 
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS=WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile="%USERPROFILE%\Desktop\Archimedes.lnk" >> %SCRIPT%
echo Set oLink=oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath="%nevroot%\run.bat" >> %SCRIPT%
echo oLink.IconLocation="%~dp0theneverhoodrestorationproject.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

rem Finish!
echo MSGBOX "Thank you for installing the Neverhood. You may now go to your desktop and click on the Archimedes shortcut to play!" > %temp%\TEMPxmessage.vbs
call %temp%\TEMPxmessage.vbs
del %temp%\TEMPxmessage.vbs /f /q