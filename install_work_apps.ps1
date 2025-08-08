#Requires -RunAsAdministrator

Write-Host "Installing various work-related apps"

$packages = @(
    "Twingate.Client",
    "AgileBits.1Password"
)

foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install --accept-source-agreements --accept-package-agreements --silent -e --id $package
}
