<#
    Blue Team Setup Script
    Author: Derrick (Viode-mld)
    Description:
        Runs all Windows hardening and defense scripts automatically.
#>

Write-Host "=== Blue Team Setup Starting ===" -ForegroundColor Cyan

# Get script folder dynamically (works no matter where you run it)
$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $ScriptPath

# Execution check
Write-Host "Running scripts from: $ScriptPath" -ForegroundColor Yellow

# Helper: Run a script safely and visibly
function Run-Script {
    param ([string]$FileName)
    Write-Host "`n--- Running $FileName ---" -ForegroundColor Green
    if (Test-Path $FileName) {
        try {
    powershell -ExecutionPolicy Bypass -File $FileName
} catch {
    Write-Host "Error running ${FileName}: $_" -ForegroundColor Red
}
    } else {
        Write-Host "File not found: $FileName" -ForegroundColor Red
    }
}

# === Run each Blue Team script in order ===
Run-Script "Change-Passwords.ps1"
Run-Script "Firewall-Setup.ps1"
Run-Script "Cleanup.ps1"
Run-Script "Quick-Forensics.ps1"
Run-Script "Autoruns-Check.ps1"

Write-Host "`n=== Blue Team Setup Complete! ===" -ForegroundColor Cyan
