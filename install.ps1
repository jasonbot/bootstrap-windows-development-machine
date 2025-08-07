#Requires -RunAsAdministrator

Write-Output "Here we go!"

.\set_up_winget.ps1
.\debloat.ps1
.\install_fonts.ps1
.\install_dev_apps.ps1
.\desktop_theme.ps1

Write-Output "Should be ready to go. Reboot once for luck."