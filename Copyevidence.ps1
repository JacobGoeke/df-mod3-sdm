# Make folder, copy contents into backup, and set permissions to read-only

mkdir evidence -Force

ni evidence.txt -Force
Add-Content evidence.txt "There is very important evidence in this file. This could expose the entire government." -Force

copy evidence.txt backup.txt -Force

move evidence.txt evidence -Force

mkdir backup -Force
move backup.txt backup -Force

icacls backup /grant:r "Users:(R)"

$backupSecurityEntry = "Permissions changed to read-only for Users"

icacls backup /save "backup\permissions.txt" -Force

mkdir security -Force
$securityLogs = Get-WinEvent -LogName Security -MaxEvents 5
$securityLogs | Export-Csv -Path security\securitylogs.csv -NoTypeInformation -Force

Add-Content -Path "security\securitylogs.csv" -Value $backupSecurityEntry -Force