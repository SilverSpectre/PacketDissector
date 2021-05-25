function GetPackets {
    Get-Content .\options.txt | Foreach-Object {
        $var = $_.Split('=')
        New-Variable -Name $var[0] -Value $var[1]
    }
    #$cred = Get-Credential
    #$cim = New-CimSession -Name $name -ComputerName $target -Authentication Negotiate -Credential $cred
    New-NetEventSession -Name $name #-CaptureMode SaveToFile -LocalFilePath "C:\NetEvents\$name" -CimSession $cim
    Add-NetEventProvider  -SessionName $name -Name "Microsoft-Windows-TCPIP" -Level "5"
    Add-NetEventPacketCaptureProvider -SessionName $name -CaptureType "Switch" -Level "5" -IpAddresses $ip -IpProtocols "2"
    Start-NetEventSession -Name $name
    ping $ip
    Stop-NetEventSession -Name $name
    Remove-NetEventSession -Name $name
    #Remove-CimSession -name $cim
}

function DisplayInfo {
    Get-Content .\options.txt | Foreach-Object {
        $var = $_.Split('=')
        New-Variable -Name $var[0] -Value $var[1]
    }
    Remove-Item .\options.txt
    echo "Filename: " $name
    tracerpt "C:\Windows\system32\config\systemprofile\AppData\Local\NetEventTrace.etl" -o ".\$name.evtx" -of EVTX
    Invoke-Item -Path ".\$name.evtx"
}