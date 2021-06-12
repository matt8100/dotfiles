param ([string]$Mac)

if ($Mac -notmatch '^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$') {
  Write-Host "Invalid MAC Address."
  exit
}

$MacByteArray = $Mac -split "[:-]" | ForEach-Object { [Byte] "0x$_"}
[Byte[]] $MagicPacket = (,0xFF * 6) + ($MacByteArray  * 16)
try {
  $UdpClient = New-Object System.Net.Sockets.UdpClient
  $UdpClient.Connect(([System.Net.IPAddress]::Broadcast),7)
  [void]$UdpClient.Send($MagicPacket,$MagicPacket.Length)
  $UdpClient.Close()
  Write-Host "Magic packet sent."
} catch {
  $UdpClient.Dispose()
  $Error | Write-Error
}
