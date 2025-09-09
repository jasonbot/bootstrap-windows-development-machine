#Requires -RunAsAdministrator

param (
    [switch]$ThisIsAVM,
    [switch]$IWorkHere
)

function New-Shortcut-To-Powershell-Script-On-Desktop {
    param (
        [string]$ScriptPath,
        [string]$ShortcutName
    )
    $desktopPath = [System.Environment]::GetFolderPath('Desktop')
    $shortcutPath = Join-Path $desktopPath "$ShortcutName.lnk"

    # Create a WScript.Shell object
    $WshShell = New-Object -comObject WScript.Shell

    $shortcut = $WshShell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = "powershell.exe"
    $shortcut.Arguments = "-NoExit -File `"$ScriptPath`""
    $shortcut.Save()

    Write-Host "Shortcut '$shortcutName' created on the desktop."
}


Write-Host "Here we go"

& "$PSScriptRoot\set_up_winget.ps1"
& "$PSScriptRoot\debloat.ps1"
& "$PSScriptRoot\install_base_apps.ps1"
& "$PSScriptRoot\desktop_theme.ps1"
& "$PSScriptRoot\install_base_apps.ps1"
Start-Process powershell.exe -ArgumentList "-NoExit -File $PSScriptRoot\sanity_check_build_env.ps1"
New-Shortcut-To-Powershell-Script-On-Desktop -ShortcutName "Setup NVM Etc" -ScriptPath "$PSScriptRoot\sanity_check_build_env.ps1"

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
