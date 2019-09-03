param(
    [string]$buildCorePowershellUrl = "https://opbuildstorageprod.blob.core.windows.net/opps1container/.openpublishing.buildcore.ps1",
    [string]$parameters
)
# Main
$errorActionPreference = 'Stop'

# Use TLS 1.2 for PowerShell.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Step-1: Download buildcore script to local
echo "download build core script to local with source url: $buildCorePowershellUrl"
$repositoryRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition
$buildCorePowershellDestination = "$repositoryRoot\.openpublishing.buildcore.ps1"
Invoke-WebRequest $buildCorePowershellUrl -OutFile "$buildCorePowershellDestination" -TimeoutSec 30

# Step-2: Run build core
echo "run build core script with parameters: $parameters"
& "$buildCorePowershellDestination" "$parameters"
exit $LASTEXITCODE
