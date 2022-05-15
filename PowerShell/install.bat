@echo off
net session >nul 2>&1
if %errorLevel% NEQ 0 (
	echo Error: Missing administrator privileges
	pause
	exit
)

if exist "%HOMEDRIVE%%HOMEPATH%\Documents\PowerShell\" (
    rmdir "%HOMEDRIVE%%HOMEPATH%\Documents\PowerShell"	
)
mklink /D "%HOMEDRIVE%%HOMEPATH%\Documents\PowerShell" "%~dp0"