# Theming
try { oh-my-posh init pwsh --config $PSScriptRoot/slim.omp.json | Invoke-Expression }
catch { "oh-my-posh execution failed" }

# Behavior
Set-PSReadLineOption -EditMode Emacs

# Alias
$env:path += ";$PSScriptRoot\Scripts"

$files = "C:\Files"
$school = "$Home\OneDrive - University of Toronto"
