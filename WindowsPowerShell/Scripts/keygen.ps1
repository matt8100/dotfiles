<#
.SYNOPSIS
Generate a diceware password
 
.DESCRIPTION
Randomly generates a diceware password using the EFF short word list at https://www.eff.org/files/2016/09/08/eff_short_wordlist_1.txt and copies to the clipboard.
#>


$hashTable = @{}
Import-Csv "$PSScriptRoot\passphrases.csv" | ForEach-Object { $hashTable[$_.Rolls] = (Get-Culture).TextInfo.ToTitleCase($_.Passphrase) }

do {
  for ($i = 1; $i -lt 5; $i++) {
    Set-Variable "random$i" $(-join $(1..6 | Get-Random -Count 4))
  }

  $password = -join $($hashTable[$random1], $hashTable[$random2], $hashTable[$random3], $random4)
  Set-Clipboard $password
  Write-Host "Your new password is $password. It has been copied to the clipboard."
  
  $response = Read-Host "Repeat? (y/n)"
} while ($response -eq "y")