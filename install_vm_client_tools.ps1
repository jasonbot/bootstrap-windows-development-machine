#Requires -RunAsAdministrator

$packages = @(
    "Spice.VDAgent"
)

Write-Host "Enabling/Installing VM Guest Packages"
foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install --accept-source-agreements --accept-package-agreements --silent -e --id $package
}
