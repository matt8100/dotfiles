# Theming
try { Import-Module Terminal-Icons }
catch { "The Terminal-Icons module is not installed" }

try { oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/slim.omp.json | Invoke-Expression }
catch { "oh-my-posh execution failed" }

# Behavior
Set-PSReadLineOption -EditMode Emacs

# Alias
$env:path += ";$PSScriptRoot\MyScripts"

$files = "C:\Files"
$school = "$Home\OneDrive - University of Toronto"
