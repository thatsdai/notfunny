for /f "tokens=3*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards" /f "ServiceName" /s^|findstr /i /l "ServiceName"') do (
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /d "1" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /d "255" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /d "3" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "DefaultTTL" /d "255" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpMaxDataRetransmissions" /d "8" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpWindowSize" /d "65535" /t REG_DWORD /f
)
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /d "255" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /d "65535" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /d "8" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /d "2" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /d "1" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableMulticastForwarding" /d "1" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /d "50" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SizReqBuf" /d "17424" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /d "65534" /t REG_DWORD /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxFreeTcbs" /d "65535" /t REG_DWORD /f
PowerShell.exe Set-NetTCPSetting -SettingName InternetCustom -InitialRto 3000
PowerShell.exe Set-NetTCPSetting -SettingName InternetCustom -MaxSynRetransmissions 8
PowerShell.exe Set-NetTCPSetting -SettingName InternetCustom -AutoTuningLevelLocal Experimental
PowerShell.exe Set-NetTCPSetting -SettingName InternetCustom -Timestamps Enabled
PowerShell.exe Set-NetIPv4Protocol -MulticastForwarding Enabled
PowerShell.exe Set-NetIPv4Protocol -GroupForwardedFragments Enabled
PowerShell.exe Set-NetIPv4Protocol -SourceRoutingBehavior Forward
PowerShell.exe Set-NetIPv4Protocol -NeighborCacheLimitEntries 128
PowerShell.exe Set-NetOffloadGlobalSetting -PacketCoalescingFilter Disabled
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing Disabled
PowerShell.exe Set-NetOffloadGlobalSetting  -ReceiveSideScaling Disabled
PowerShell.exe Set-NetIsatapConfiguration -State Enabled
PowerShell.exe Set-NetIPv4Protocol -SourceRoutingBehavior Forward
PowerShell.exe Restart-NetAdapter -Name *
