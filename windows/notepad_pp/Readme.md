The `ExecuteBatch.bat` script is useful to execute other batch
scripts in [Notepad++](https://notepad-plus-plus.org/)

# Use-case
When you develop a windows batch script in Notepad++ you want to
execute it directly via one key-press (e.g. F9)
The `ExecuteBatch.bat` script will
* execute your script (the currently open document in Notepadd++)
* show if your script worked or returned an error
* wait for 10 seconds so that you can see the output
  * you can press any key to stop waiting immediately
  * or you can press CTRL-C to abort waiting (e.g. when you want to
    scroll the cmd-window or copy the window text, etc.)

# Installation/Configuration
Just save the file to your development machine and then configure
Notepad++ to execute it on a key-press: e.g. F9.

## Configure Run command
In Notepad++ press open the `Run...` dialogue:  
Press `F5` or select `Run` - `Run..` from the menu

![Notepad++ Run Dialogue](img/NotepadRunDlg.png)

In the `The Program to Run` field, enter the full path to the downloaded
 `ExecuteBatch.bat` script and append the Notepad++ parameters for the
  currently open file "$(CURRENT_DIRECTORY)" "$(FILE_NAME)":

Example:
```
    C:\scripts\ExecuteBatch.bat "$(CURRENT_DIRECTORY)" "$(FILE_NAME)"
```
Note: you must of course replace `C:\scripts\` with the correct location
, where you downloaded the `ExecuteBatch.bat` script.

Then click `Save...` and assign the shortcut key:  
![Notepad++ Run Dialogue](img/NotepadShortcutDlg.png)