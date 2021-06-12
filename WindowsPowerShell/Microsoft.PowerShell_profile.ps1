Import-Module oh-my-posh
Set-PoshPrompt -Theme slim

$ProfileRoot = (Split-Path -Parent $MyInvocation.MyCommand.Path)
$env:path += ";$ProfileRoot"

Set-Alias spicetify "$Home\.spicetify\spicetify.exe" -option ReadOnly
Set-Alias blockthespot "$Home\.spicetify\BlockTheSpot.bat" -option ReadOnly
Set-Alias wol "$PSScriptRoot\wol.ps1" -option ReadOnly
