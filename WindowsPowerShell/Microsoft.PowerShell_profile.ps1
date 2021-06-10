Import-Module oh-my-posh
Set-PoshPrompt -Theme slim

$ProfileRoot = (Split-Path -Parent $MyInvocation.MyCommand.Path)
$env:path += ";$ProfileRoot"

Set-Alias spicetify "C:\Users\Matthew Mao\.spicetify\spicetify.exe" -option ReadOnly
Set-Alias blockthespot "C:\Users\Matthew Mao\.spicetify\BlockTheSpot.bat" -option ReadOnly
