# Light UI, dark start menu etc
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes" -Name "SystemUsesLightTheme" -Value 0 -PropertyType "Dword"
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes" -Name "AppsUseLightTheme" -Value 1 -PropertyType "Dword"

# Solid color BG
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Control Panel\Desktop" -Name "Wallpaper" -Value "" -PropertyType "String"
Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\Control Panel\Colors" -Name "Background" -Value "" -PropertyType "249 245 241"
