$users = Import-csv "C:\powershell\users.csv"
$logfile = "C:\powershell\IAM_Log.txt"
foreach($user in $users) {
if($user.Status -eq "Terminated") {
Write-Host "DISABLING: $($user.Username) - Department: $($user.Department)"
        Add-Content -Path $logFile -Value "$(Get-Date) - DISABLED: $($user.Username) - Department: $($user.Department)"
    } else {
        Write-Host "SKIPPING: $($user.Username) - Still Active"
        Add-Content -Path $logFile -Value "$(Get-Date) - SKIPPED: $($user.Username) - Still Active"
    }
}
Write-Host "Process completed! Log saved to $logFile"