# Quick check for users, processes, ports

Write-Output "=== Active Users ==="
quser
Write-Output "=== Running Processes ==="
Get-Process | Sort-Object CPU -Descending | Select -First 10
Write-Output "=== Open Ports ==="
Get-NetTCPConnection -State Listen
