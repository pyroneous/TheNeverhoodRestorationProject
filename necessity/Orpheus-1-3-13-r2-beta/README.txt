README FILE FOR: /necessity/Orpheus-1-3-13-r2-beta/
--------------------------------------------------------------------
WHOSE IDEA WAS THIS?
Same logic, terribad code, slow installation, lots of errors, probably doesn't work on most systems because of my experiments.
SOURCE(S): 
|   __neverhood
│   install.bat
│   prettyversion.txt
│   README.TXT
│   run.bat
│   sdbinst.exe
│   theneverhoodfix.sdb
│   version.txt

 RESOURCE(S):

--------------------------------------------------------------------
LOGIC:
#1.) Installer starts Garden.exe.
#2.) Garden.exe starts install.bat with elevated privileges. 
#3.) install.bat makes compatibility changes to nhc.exe/setup.95 (Windows 95/256 colors).
#4.) install.bat sets up installation; user copies contents of the Neverhood into generated NEVERHOOD_CONTENT if piracy is involved.
#5.) install.bat uses sdbinst to run the SDB file on nhc.exe (there is no source for either of these; the SDB is generated inside of ACT).
#6.) IT'S SUPER EFFECTIVE. 
#7.) install.bat dodges Garden.exe's attack!
#8.) install.bat uses "Run setup95.exe"! 
#9.) It's super effective!
#10.) Windows 95 uses "WAIT A SECOND YOU'RE NOT COMPATIBLE!" 
#11.) It's not very effective...
#12.) User installs the Neverhood. 
#13.) install.bat generates shortcut on desktop using theneverhoodrestorationproject.ico. 
#14.) install.bat ends transmission. 
#15.) Garden.exe ends transmission.
#16.) Installer ends transmission. 
#17.) Pokemon emulator ends transmission.

--------------------------------------------------------------------
--------------------------------------------------------------------
A R C H I M E D E S 2 . 5 . 1 3 - B E T A :: P Y R O N E O U S
Website: http://www.pyroneous.com/ 
Sourceforge: http://theneverhood.sourceforge.net/ 
git clone https://github.com/pyroneous/TheNeverhoodRestorationProject.git