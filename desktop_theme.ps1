#Requires -RunAsAdministrator

Write-Host "Setting desktop theme"

# Light UI, dark start menu etc
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -Type "Dword"
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 1 -Type "Dword"

# Search off
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchBoxTaskbarMode" -Value 0 -Type "Dword"

# Solid color BG
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" -Name "BackgroundType" -Value 1 -Type "Dword"
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Control Panel\Desktop" -Name "Wallpaper" -Value "" -Type "String"
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Control Panel\Colors" -Name "Background" -Value "249 245 241" -Type "String"

# Start button on left
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 0 -Type "Dword"

# Refresh
Stop-Process -Name explorer -Force; Start-Process explorer
