# Check startup programs (possible persistence)

Write-Output "=== Startup Programs ==="
Get-CimInstance Win32_StartupCommand | Select-Object Name, Command
