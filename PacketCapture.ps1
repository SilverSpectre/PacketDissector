[string]$session = Read-Host -Prompt 'Please enter a filename'
$targets = Read-Host -Prompt 'Please enter a target computer name'
$targetIPs = "192.168.80.10" #Variable for target's IPs, if necessary. May delete in future patch.
New-CimSession -ComputerName $targets
New-NetEventSession -Name $session -CaptureMode SaveToFile -LocalFilePath "C:\NetEvents\$session"
Add-NetEventProvider  -SessionName $session -Name "Microsoft-Windows-TCPIP" -Level "5"
Add-NetEventPacketCaptureProvider -SessionName $session -CaptureType "Switch" -Level "5" -IpAddresses $targetIPs -IpProtocols "2"