#Requires -RunAsAdministrator

$packages = @(
    "Docker.DockerDesktop"
)

Write-Host "Enabling/Installing Virtualization Packages"
foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install --accept-source-agreements --accept-package-agreements --silent -e --id $package
}

Write-Host "Enabling/Installing Windows Sandbox"
Enable-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM" -All

Write-Host "Enabling/Installing a Fedora WSL machine"

$targetDistro = "FedoraLinux-42"
$wslDistros = wsl.exe --list --quiet
if (-not ($wslDistros -contains $targetDistro)) {
    Write-Host "Need to install $targetDistro in WSL"
    wsl --install $targetDistro
    wsl --set-default $targetDistro
    wsl --distribution $targetDistro --exec "./install_fedora_packages.sh"
}
