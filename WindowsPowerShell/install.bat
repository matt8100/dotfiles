@echo off
net session >nul 2>&1
if %errorLevel% NEQ 0 (
	echo Error: Missing administrator privileges
	pause
	exit
)

if exist "%HOMEDRIVE%%HOMEPATH%\Documents\WindowsPowerShell\" (
    rmdir "%HOMEDRIVE%%HOMEPATH%\Documents\WindowsPowerShell"	
)
mklink /D "%HOMEDRIVE%%HOMEPATH%\Documents\WindowsPowerShell" "%~dp0"