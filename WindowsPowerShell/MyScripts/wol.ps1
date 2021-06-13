# .SYNOPSIS
# Wakes a machine through Wake On LAN.
 
# .DESCRIPTION
# wol sends a Wake On LAN magic packet to a given machine's MAC address.
 
# .PARAMETER Mac
# MacAddress of target machine to wake.
 
# .EXAMPLE
# > wol A0:DE:F1:69:BE:02
# > Magic packet sent.

Param ([string]$MacAddress)

if (!$MacAddress) {
  Write-Host "Missing MAC Address"
  exit
}

if ($MacAddress -notmatch '^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$') {
  Write-Host "Invalid MAC Address."
  exit
}

$MacByteArray = $MacAddress -split "[:-]" | ForEach-Object { [Byte] "0x$_" }
[Byte[]] $MagicPacket = (, 0xFF * 6) + ($MacByteArray  * 16)
try {
  $UdpClient = New-Object System.Net.Sockets.UdpClient
  $UdpClient.Connect(([System.Net.IPAddress]::Broadcast), 7)
  [void]$UdpClient.Send($MagicPacket, $MagicPacket.Length)
  $UdpClient.Close()
  Write-Host "Magic packet sent."
} catch {
  $UdpClient.Dispose()
  $Error | Write-Error
}
