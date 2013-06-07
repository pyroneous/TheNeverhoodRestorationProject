README FILE FOR: /jar/ 
--------------------------------------------------------------------
The /jar/ directory, in the last release, used to provide some audio changes to the game. This no longer occurs, because the SDB file (described in /necessity/) covers it now. 
FUNCTIONS OF THE /JAR/:
 - to notify when needed to update
 - to provide a wrapper for the installation 
 - to force administrator privileges 
 - to withstand bad Java code 
SOURCE(S): 
 - UpdateMechanism.jar 
 - UpdateMechanism*.class
 RESOURCE(S):
 - Internet
 - version.txt
 - prettyversion.txt
 - DUGFB__.TTF (font)
 - nhood.bmp (32-bit'd Neverhood icon) 

--------------------------------------------------------------------
LOGIC:
#1.) GUI initiation.
#2.) Checks for version/prettyversion TXT files found in "The Neverhood Restoration Project" folder. 
#3a.) Checks if version.txt content is equivalent to that of http://theneverhood.sourceforge.net/version.txt. 
#3b.) Display prettyversion.txt on record and prettyversion.txt in webserver.
#4.) If so, disable download & install button, display "Updated." 
#5.) If not, enable download & install button, display instructions. 
--------------------------------------------------------------------
--------------------------------------------------------------------
A R C H I M E D E S 2 . 5 . 1 3 - B E T A :: P Y R O N E O U S
Website: http://www.pyroneous.com/ 
Sourceforge: http://theneverhood.sourceforge.net/ 
git clone https://github.com/pyroneous/TheNeverhoodRestorationProject.git