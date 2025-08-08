#Requires -RunAsAdministrator

Write-Host "Here we go"

param (
    [switch]$ThisIsAVM,
    [switch]$IWorkHere
)

.\set_up_winget.ps1
.\debloat.ps1
.\install_base_apps.ps1
.\desktop_theme.ps1

if ($IWorkHere) {
    .\install_fonts.ps1
    .\install_zed.ps1
}

if (!$ThisIsAVM) {
    .\install_virtualization.ps1
}
else {
    .\install_vm_client_tools.ps1
}

if (!$ThisIsAVM -and $IWorkHere) {
    .\install_work_apps.ps1
}

Write-Host "Should be ready to go. Reboot once for luck."
