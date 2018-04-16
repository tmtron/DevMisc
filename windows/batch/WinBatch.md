Some useful info about batch scripts

# Send-to Folder

* In Explorer address-bar enter: `shell:sendto`
* In a batch-script use: `%APPDATA%\Microsoft\Windows\SendTo`

# String Manipulation
Batch script: string manipulation: 
http://www.dostips.com/DtTipsStringManipulation.php#Snippets.Replace 

Remove the last character from a string: e.g. remove backslash from directory:
`set SCRIPT_DIR_NO_BACKSLASH=%SCRIPT_DIR:~0,-1%`

Get the last part of a directory path:
`for %%f in (%SCRIPT_DIR_NO_BACKSLASH%) do set SCRIPT_DIR_LAST_PART=%%~nxf`

# Stop/kill/close an application:
`taskkill /IM notepad.exe`

# Start exe file without waiting:
`start "" %BinDir%\Gui.exe /ArgsForGuiExe`
* the first 2 double quotes are the window title (which is not needed when starting an exe)
* http://stackoverflow.com/questions/5909012/windows-batch-script-launch-program-and-exit-console
