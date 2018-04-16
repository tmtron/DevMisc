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

# Directories

## Copy Directory recursively
`xcopy /S SrcDir TargetDir\`
* `/S`: Copies directories and subdirectories except empty ones.
* `/Y`: Suppresses prompting to confirm you want to overwrite an existing destination file 

## Deleting all contents of a directory
```
pushd DirToDelete || goto :ERROR
rd /q /s . 2> NUL
popd
exit /b 0
:ERROR
exit /b 1
```
* first we go into the directory
* then we delete everything in the dir and subdirs - but keep the current direcotry (since we are currently in this dir)
* finally we go back to the original dir
* note: `|| goto :ERROR` is very important!  
  if we don't use this and DirToDelete does not exist, the `rd` command would delete the current directory!
* see also: http://stackoverflow.com/a/24482102/1041641
