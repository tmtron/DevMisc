@echo off
SETLOCAL EnableDelayedExpansion

set exitCode=1

if "%3%"=="" (
	set exitMode=timeout
	set timeout=10
) else (
	if "%3%"=="pause" (
		set exitMode=pause
	) else (
		set exitMode=timeout
		set timeout=%3
	)
)

rem ****
rem check parameters

set workDir=%1%
rem %1:"=% will remove quotes 
rem see https://stackoverflow.com/a/21765973/6287240
set workDir=%workDir:"=%

if "%workDir%"=="" (
	echo "workDir" parameter missing
	goto PARAM_ERR
)
set batchFile=%2%
set batchFile=%batchFile:"=%
if "%batchFile%"=="" (
	echo "batchFile" parameter missing
	goto PARAM_ERR
)

rem ****
rem check if files/dirs exist
set batchFileAbs="%workDir%\%batchFile%"
if not exist %batchFileAbs% (
	echo file does not exist "%batchFileAbs%"
	set exitCode=2
	goto EXIT_OR_WAIT
)

for %%i in (%batchFileAbs%) do (
	rem %%~xi is the file extension: e.g. ".bat"
	rem see https://stackoverflow.com/a/138847/6287240
	if not "%%~xi"==".bat" (
		echo the file must have ".bat" extension
		set exitCode=2
		goto EXIT_OR_WAIT
	)
)

rem ****
rem work

echo executing "%batchFile% in %workDir%"
cd /D "%workDir%"
set startTime=%time%
call "%batchFile%"
echo. 
if errorlevel 1 (
	echo Script "%batchFile%" FAILED: %ERRORLEVEL%
) else (
	echo Script "%batchFile%" SUCCEEDED
)
echo Start Time: %startTime%
echo   End Time: %time%

set exitCode=0
goto EXIT_OR_WAIT

:PARAM_ERR
echo.
echo USAGE
echo.
echo Expected parameters: workDir batchFile [ExitMode]
echo.
echo * workDir   the working directory where the batchFile is located
echo * batchFile the batch file to execute
echo * ExitMode  is optional and can have these values:
echo   * pause: the script will wait for a key-press
echo   * missing (DEFAULT): is the same as passing 10
echo   * any number: the script will wait for the specified number of seconds and then exit. During the timeout, you can:
echo     * press any key to stop waiting immediately
echo     * or press CTRL-C to abort waiting (e.g. when you want to scroll the cmd-window or copy the window text, etc.)
echo             pause will wait for a key-press
echo             SEC   will timeout for the specified number of seconds
echo.
exit /B 2

:EXIT_OR_WAIT
if "%exitMode%"=="pause" (
	pause
	exit /B %exitCode%
) 

if not "%timeout%"=="0" TIMEOUT %timeout% 





