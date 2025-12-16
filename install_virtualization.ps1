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
Enable-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM" -All -NoRestart
Write-Host "Adding Context Menus for Windows Sandbox"
function Read-Host() {}
irm https://raw.githubusercontent.com/Joly0/Run-in-Sandbox/master/Install_Run-in-Sandbox.ps1 | iex
Remove-Item -Path function:Read-Host

Write-Host "Enabling/Installing a Fedora WSL machine"

$targetDistro = "FedoraLinux-42"
$wslDistros = wsl.exe --list --quiet
if (-not ($wslDistros -contains $targetDistro)) {
    Write-Host "Need to install $targetDistro in WSL"
    wsl --install $targetDistro
    wsl --set-default $targetDistro
    wsl --distribution $targetDistro --exec "./install_fedora_packages.sh"
}




