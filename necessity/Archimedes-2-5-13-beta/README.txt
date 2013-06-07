README FILE FOR: /necessity/Archimedes-2-5-13-beta/
--------------------------------------------------------------------
This is the source of the core. It consists of sdbinst.exe, which is the installation command executable for Microsoft Windows' Application Compatibility Toolkit, and Garden.exe, which is an application that simply runs install.bat in administrator privileges. Either of these programs needn't opensource, and we're not in the particular ability to give you the source, for the following respective reasons:
 - sdbinst.exe is a closed-source program that does not belong to us. It is an open freeware that is necessary to the application, fixing cutscenes and audio. 
 - garden.exe's source has been lost. Irresponsible of me, but I believe that it is such a simple program that it isn't necessary to have the source. Literally all it does is open a command prompt and run the command "../install.bat", compiling inside of the __garden directory.
The /necessity directory is the main container for all subdirectories.
FUNCTIONS OF THE /necessity/Archimedes-2-5-13-beta/:
 - to provide the core of the Neverhood fix. No other resource inside the process of installation will be used to better the processing ability for the Neverhood. 
 - to better audio. 
 - to fix cutscenes. 
 Note that this source is not actually included into the installation; these files are all packed into an executable file. 
SOURCE(S): 
│   install.bat
│   prettyversion.txt
│   README.TXT
│   run.bat
│   sdbinst.exe
│   theneverhoodfix.sdb
│   version.txt
│
├───NEVERHOOD_CONTENT
└───__garden
        Garden.exe
 RESOURCE(S):
│   theneverhoodrestorationproject.ico

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