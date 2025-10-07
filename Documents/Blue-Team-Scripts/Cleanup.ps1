# Disable insecure services and accounts

# Disable SMBv1
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force

# Disable Guest account
net user guest /active:no

# Disable Telnet service
Stop-Service -Name telnet -Force
Set-Service -Name telnet -StartupType Disabled
