@echo off
SETLOCAL EnableDelayedExpansion

if "%3%"=="" (
	set timeout=10
) else (
	set timeout=%3
)

set ExitCode=1
rem ****
rem check parameters

if "%1%"=="" (
	echo "workDir" parameter missing
	goto PARAM_ERR
)
if "%2%"=="" (
	echo "batchFile" parameter missing
	goto PARAM_ERR
)

rem ****
rem check if files/dirs exist

set workDir=%1%
rem %1:"=% will remove quotes 
rem see https://stackoverflow.com/a/21765973/6287240
set workDir=%workDir:"=%
if not exist %workDir% (
	echo dir does not exist "%workDir%"
	set ExitCode=2
	goto EXIT_OR_WAIT
)

set batchFile=%2%
set batchFile=%batchFile:"=%
set batchFileAbs=%workDir%\%batchFile%
if not exist %batchFileAbs% (
	echo file does not exist "%batchFileAbs%"
	set ExitCode=2
	goto EXIT_OR_WAIT
)

for %%i in (%batchFileAbs%) do (
	rem %%~xi is the file extension: e.g. ".bat"
	rem see https://stackoverflow.com/a/138847/6287240
	if not "%%~xi"==".bat" (
		echo the file must have ".bat" extension
		set ExitCode=2
		goto EXIT_OR_WAIT
	)
)

rem ****
rem work

echo executing "%batchFile% in %workDir%"
cd /D %workDir%
set startTime=%time%
call %batchFile%
echo. 
if errorlevel 1 (
	echo Script "%batchFile%" FAILED: %ERRORLEVEL%
) else (
	echo Script "%batchFile%" SUCCEEDED
)
echo Start Time: %startTime%
echo   End Time: %time%

set ExitCode=0
goto EXIT_OR_WAIT

:PARAM_ERR
echo expected parameters: workDir batchFile [timeout]
echo timout: default is 10 seconds
set ExitCode=2

:EXIT_OR_WAIT
if not %timeout%==0 (
	echo. 
	echo Press CTRL+C to abort
	TIMEOUT %timeout%
)
exit /B %ExitCode%



