#Requires -RunAsAdministrator

Write-Host "Making sure Winget works"

$progressPreference = 'silentlyContinue'

Write-Host "   Nuget step"
Install-PackageProvider -Name NuGet -Force | Out-Null
Write-Host "   Winget install step"
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
Write-Host "   Winget repair step"
Repair-WinGetPackageManager -AllUsers

Write-Host "Enabling Dev Mode"
$RegistryKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
if (-not(Test-Path -Path $RegistryKeyPath)) {
    New-Item -Path $RegistryKeyPath -ItemType Directory -Force
}

New-ItemProperty -Path $RegistryKeyPath -Name AllowDevelopmentWithoutDevLicense -PropertyType DWORD -Value 1
