Param
(
    [Parameter(Mandatory=$true)]
    [string]$IdentityProviderSecret
)
write-host $IdentityProviderSecret

$configMapPath = "./Configuration/ConfigMaps/appsettings.configmaps.json"
$configMapJson = Get-Content $configMapPath | ConvertFrom-Json
$now = Get-Date
$configMapJson.ConfigMaps.IdentityProviderClientId = -join("configMap", " ", $now.ToUniversalTime().ToString('HH:mm:ss'))
$configMapJson | ConvertTo-Json | set-content $configMapPath


$secretPath = "./Configuration/Secrets/appsettings.secrets.json"
$secretJson = Get-Content $secretPath | ConvertFrom-Json
$now = Get-Date
$secretJson.Secrets.IdentityProviderSecret = -join("$IdentityProviderSecret", " ", $now.ToUniversalTime().ToString('HH:mm:ss'))
$secretJson | ConvertTo-Json | set-content $secretPath



