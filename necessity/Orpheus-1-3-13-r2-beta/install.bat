rem @ECHO OFF
SETLOCAL 
SET "traversity=C:\Program Files (x86)\"
if not exist "C:\Program Files (x86)" SET "traversity=C:\Program Files\"

SET intricacy=%traversity%The Neverhood Restoration Project
SET obscurity=%traversity%DreamWorks Interactive
SET psychedelia=%obscurity%\Neverhood
SET abstraction=WAVistaWin7.exe
del C:\setup95.exe /f

:removenrp
if exist "%traversity%The Neverhood Restoration Project Julia\unins000.exe" ( 
	"%traversity%The Neverhood Restoration Project Julia\unins000.exe"
)

:delreg
if %PROCESSOR_ARCHITECTURE%==x86 ( 
	reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\DreamWorks Interactive" /f
) else ( 
	if %PROCESSOR_ARCHITECTURE%==AMD64 ( 
		reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\DreamWorks Interactive" /f
	) else (
		reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\DreamWorks Interactive" /f
)) 

if exist "%obscurity%" echo y | rmdir /S /Q "%obscurity%"


mkdir "%obscurity%"
mkdir "%psychedelia%"
mkdir "NEVERHOOD_CONTENT"
copy /Y "%~dp0%abstraction%" "%psychedelia%"

for %%D in (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z) do (
	if exist %%D:\setup95.exe (
		echo MSGBOX "Hey. Thank you for purchasing the Neverhood. That is, if you're not using an burned ISO/exploitation." > %temp%\TEMPmessage.vbs
		call %temp%\TEMPmessage.vbs
		del %temp%\TEMPmessage.vbs /f /q
		START %%D:\setup95.exe
		goto file_check
	)
	pause
)
if not defined DRIVE (
	:superman
	echo MSGBOX "A folder named NEVERHOOD_CONTENT has been generated outside of the file. Please check the folder by which you ran setup.jar in. Copy the content of the Neverhood into the NEVERHOOD_CONTENT directory. Now checking for files in NEVERHOOD_CONTENT folder." > %temp%\TEMPmessage.vbs
	call %temp%\TEMPmessage.vbs
	del %temp%\TEMPmessage.vbs /f /q
	for %%f in (DATA
				setup
				setup95.exe
				AUTORUN.INF
				nhood.ico) do if not exist "NEVERHOOD_CONTENT\%%f" (
		ping 1.1.1.1 -n 1 -w 1000 > output
		goto superman
	   )
	echo MSGBOX "Pyroneous did not distribute the Neverhood illicitly to you. Remember that the only legal way to run the Neverhood is to buy it. We will still permit you to install the Neverhood, but we are not responsible for your actions. You can read our full purposes at theneverhood.sourceforge.net. Thanks!" > %temp%\TEMPmessage.vbs
	call %temp%\TEMPmessage.vbs
	del %temp%\TEMPmessage.vbs /f 
	START "%getpath%setup95.exe"
) else (
)

:file_check
if exist "%psychedelia%\nhc.exe" (goto file_exists) else (timeout /t 1 /nobreak > output)
goto file_check

:file_exists
copy /Y "%~dp0version.txt" "%psychedelia%"
copy /Y "%~dp0prettyversion.txt" "%psychedelia%"
copy /Y "%~dp0run.bat" "%psychedelia%" 
goto checkfiles 

:checkfiles
for %%f in (nhc.exe 
            readme.txt 
            HD.BLB 
            smackw32.dll 
            setup95.exe 
            WAVistaWin7.exe
           ) do if not exist "%psychedelia%\%%f" (
    ping 1.1.1.1 -n 1 -w 1000 > output
    goto checkfiles
   )

taskkill.exe /F /IM setup95.exe /T
echo MSGBOX "Thank you for installing the Neverhood. You may now go to your desktop and click on the Orpheus shortcut to play!" > %temp%\TEMPxmessage.vbs
call %temp%\TEMPxmessage.vbs
del %temp%\TEMPxmessage.vbs /f /q
rename "%psychedelia%\nhc.exe" wa.exe
   
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS=WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile="%USERPROFILE%\Desktop\Orpheus.lnk" >> %SCRIPT%
echo Set oLink=oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath="%psychedelia%\run.bat" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

:end