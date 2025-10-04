# List of users
$users = @("User1", "User2", "User3")

function Gen-Pass {
    # Generate random 12-char password
    -join ((48..57) + (65..90) + (97..122) | Get-Random -Count 12 | % {[char]$_})
}

foreach ($u in $users) {
    try {
        $newpass = Gen-Pass
        $securePass = ConvertTo-SecureString $newpass -AsPlainText -Force
        Set-LocalUser -Name $u -Password $securePass
        Write-Output "[+] Password changed for $u -> $newpass"
    } catch {
        Write-Output "[-] User $u does not exist"
    }
}
