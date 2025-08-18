#Requires -RunAsAdministrator

Write-Host "Setting desktop theme"

# Light UI, dark start menu etc
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -Type "Dword"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 1 -Type "Dword"

# Search off
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchBoxTaskbarMode" -Value 0 -Type "Dword"

# Solid color BG
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" -Name "BackgroundType" -Value 1 -Type "Dword"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value "" -Type "String"
Set-ItemProperty -Path "HKCU:\Control Panel\Colors" -Name "Background" -Value "54 129 177" -Type "String"

# Start button on left
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 0 -Type "Dword"

# Turn off the "show more" chevron in system tray 
Set-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" -Name "SystemTrayChevronVisibility" -Value 0

# Refresh
Stop-Process -Name explorer -Force; Start-Process explorer


