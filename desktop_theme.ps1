#Requires -RunAsAdministrator

Write-Output "Setting desktop theme"

# Light UI, dark start menu etc
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes" -Name "SystemUsesLightTheme" -Value 0 -Type "Dword"
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes" -Name "AppsUseLightTheme" -Value 1 -Type "Dword"

# Solid color BG
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Control Panel\Desktop" -Name "Wallpaper" -Value "" -Type "String"
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Control Panel\Colors" -Name "Background" -Value "249 245 241" -Type "String"

# Refresh
Stop-Process -Name explorer -Force; Start-Process explorer
