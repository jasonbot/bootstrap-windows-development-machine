#Requires -RunAsAdministrator

Invoke-RestMethod https://api.github.com/repos/jasonbot/bootstrap-windows-development-machine/zipball/main -OutFile "$env:TEMP/bootstrapdevmachine.zip"
if (Test-Path "$env:TEMP/bootstrapdevmachine") {
    Write-Output ""
    Write-Output "> Cleaning up old bootstrapdevmachine folder..."
    Get-ChildItem -Path "$env:TEMP/bootstrapdevmachine" | Remove-Item -Recurse -Force
}
Expand-Archive "$env:TEMP/bootstrapdevmachine.zip" "$env:TEMP/bootstrapdevmachine"
Remove-Item "$env:TEMP/bootstrapdevmachine.zip"

Get-ChildItem -Path "$env:TEMP/bootstrapdevmachine/jasonbot-bootstrap-windows-development-machine-*" -Recurse | Move-Item -Destination "$env:TEMP/bootstrapdevmachine"

Set-Location "$env:TEMP/bootstrapdevmachine"

.\set_up_winget.ps1
.\debloat.ps1
.\install_fonts.ps1
.\install_dev_apps.ps1
.\desktop_theme.ps1

Write-Output "Should be ready to go. Reboot once for luck."