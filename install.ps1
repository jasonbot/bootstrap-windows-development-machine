#Requires -RunAsAdministrator

Write-Output "Here we go!"

.\set_up_winget.ps1
.\debloat.ps1
.\desktop_theme.ps1
.\install_base_apps.ps1

Write-Output "Should be ready to go. Reboot once for luck."
Write-Output "--------------------------------------------"
Write-Output "You may want to run:"
Write-Output "  * ./install_fonts.ps1 for fonts"
Write-Output "  * ./install_dev_apps.ps1 for additional work apps"
Write-Output "  * ./install_zed.ps1 for the Zed IDE"
Write-Output "  * ./install_fedora.ps1 to get a WSL machine bootstrapped for full-stack dev"
