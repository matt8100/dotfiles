if (-not (Get-Module -ListAvailable -Name oh-my-posh)) {
	Set-PSRepository PSGallery -InstallationPolicy Trusted
    Install-Module oh-my-posh -Scope CurrentUser | Out-Null
}
Set-PoshPrompt -Theme slim

$env:path += ";$PSScriptRoot"

Get-ChildItem "$PSScriptRoot\MyScripts" -Filter *.ps1 | ForEach-Object {
  $filename = $_.BaseName
  $filepath = $_.FullName
  Set-Alias $filename $filepath
}

Set-Alias spicetify "$Home\.spicetify\spicetify.exe"
Set-Alias blockthespot "$Home\.spicetify\BlockTheSpot.bat"