# Encrypts data in evidence folder

$keyData = Get-Content -Path .\evidence\evidence.txt

$secureData = ConvertTo-SecureString -String $keyData -AsPlainText -Force

$secureData | ConvertFrom-SecureString | Set-Content -Path security\secureData.txt

icacls .\security\secureData.txt /grant:r "Users:(R)"