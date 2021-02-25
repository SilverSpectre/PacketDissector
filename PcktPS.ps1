#Hopeful stretch goal to link 2 specific computers
    #$cred = Get-Credential
    #New-CimSession - Name $name -ComputerName $targets -Credential $cred
    #New-NetEventSession -Name $name -CaptureMode SaveToFile -LocalFilePath "C:\NetEvents\$name"
    #Add-NetEventProvider  -SessionName $name -Name "Microsoft-Windows-TCPIP" -Level "5"
    #Add-NetEventPacketCaptureProvider -SessionName $name -CaptureType "Switch" -Level "5" -IpAddresses $ip -IpProtocols "2"
    
#Default NetTrace location
    #C:\Windows\system32\config\systemprofile\AppData\Local\NetEventTrace.etl

#Current runnning script
    #User input
param($name, $ip)
New-NetEventSession -Name $name
Add-NetEventProvider  -SessionName $name -Name "Microsoft-Windows-TCPIP" -Level "5"
Add-NetEventPacketCaptureProvider -SessionName $name -CaptureType "Switch" -Level "5" -IpAddresses $ip -IpProtocols "2"
Start-NetEventSession -Name $name
ping $ip
Stop-NetEventSession -Name $name
Remove-NetEventSession -Name $name