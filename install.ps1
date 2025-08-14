#Requires -RunAsAdministrator

param (
    [switch]$ThisIsAVM,
    [switch]$IWorkHere
)


Write-Host "Here we go"

& "$PSScriptRoot\set_up_winget.ps1"
& "$PSScriptRoot\debloat.ps1"
& "$PSScriptRoot\install_base_apps.ps1"
& "$PSScriptRoot\desktop_theme.ps1"

if ($IWorkHere) {
    & "$PSScriptRoot\install_fonts.ps1"
    &" $PSScriptRoot\install_zed.ps1"
}

if (!$ThisIsAVM) {
    & "$PSScriptRoot\install_virtualization.ps1"
}
else {
    & "$PSScriptRoot\install_vm_client_tools.ps1"
}

if (!$ThisIsAVM -and $IWorkHere) {
    & "$PSScriptRoot\install_work_apps.ps1"
}

Write-Host "Should be ready to go. Reboot once for luck."
