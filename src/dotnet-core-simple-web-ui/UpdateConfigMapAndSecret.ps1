Param
(
    [Parameter(Mandatory=$true)] [string]$IdentityProviderClientId, [Parameter(Mandatory=$true)] [string]$IdentityProviderSecret, [Parameter(Mandatory=$true)] [string]$DropFolder
)
write-host "IdentityProviderSecret: $IdentityProviderSecret"
write-host "IdentityProviderClientId: $IdentityProviderClientId"
write-host "DropFolder: $DropFolder"

$configMapPath = "$DropFolder/Configuration/ConfigMaps/appsettings.configmaps.json"
$configMapJson = Get-Content $configMapPath | ConvertFrom-Json
$now = Get-Date
$configMapJson.ConfigMaps.IdentityProviderClientId = -join("$IdentityProviderClientId", " ", $now.ToUniversalTime().ToString('HH:mm:ss'))
$configMapJson | ConvertTo-Json | set-content $configMapPath


$secretPath = "$DropFolder/Configuration/Secrets/appsettings.secrets.json"
$secretJson = Get-Content $secretPath | ConvertFrom-Json
$now = Get-Date
$secretJson.Secrets.IdentityProviderSecret = -join("$IdentityProviderSecret", " ", $now.ToUniversalTime().ToString('HH:mm:ss'))
$secretJson | ConvertTo-Json | set-content $secretPath



