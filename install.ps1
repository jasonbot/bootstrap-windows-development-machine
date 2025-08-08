#Requires -RunAsAdministrator

Write-Output "Here we go!"

.\set_up_winget.ps1
.\debloat.ps1
.\desktop_theme.ps1
.\install_base_apps.ps1

Write-Output "Should be ready to go. Reboot once for luck."
Write-Output "--------------------------------------------"
Write-Output "You may want to run:"
write-output "  * ./install_fonts.ps1 for fonts"
Write-Output "  * ./install_dev_apps.ps1 for additional works apps"