#User input
[string]$session = Read-Host -Prompt 'Please enter a filename'
$targets = Read-Host -Prompt 'Please enter a target computer name'
$targetIPs = Read-Host -Prompt 'Please enter a target IP'

#Hopeful stretch goal to link 2 specific computers
    #$cred = Get-Credential
    #New-CimSession - Name $session -ComputerName $targets -Credential $cred
    #New-NetEventSession -Name $session -CaptureMode SaveToFile -LocalFilePath "C:\NetEvents\$session"
    #Add-NetEventProvider  -SessionName $session -Name "Microsoft-Windows-TCPIP" -Level "5"
    #Add-NetEventPacketCaptureProvider -SessionName $session -CaptureType "Switch" -Level "5" -IpAddresses $targetIPs -IpProtocols "2"
    
#Default NetTrace location
    #C:\Windows\system32\config\systemprofile\AppData\Local\NetEventTrace.etl

#Current runnning script
New-NetEventSession -Name $session
Add-NetEventProvider  -SessionName $session -Name "Microsoft-Windows-TCPIP" -Level "5"
Add-NetEventPacketCaptureProvider -SessionName $session -CaptureType "Switch" -Level "5" -IpAddresses $targetIPs -IpProtocols "2"
Start-NetEventSession
ping $targets
Stop-NetEventSession