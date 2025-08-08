Write-Output "Setting up various developer apps"

$packages = @(
    "Docker.DockerDesktop",
    "Twingate.Client",
    "AgileBits.1Password",
    "Amazon.AWSCLI"
)

foreach ($package in $packages) {
    Write-Output "Installing $package..."
    winget install --accept-source-agreements --accept-package-agreements --silent -e --id $package
}
