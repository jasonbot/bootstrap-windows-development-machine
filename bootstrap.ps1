#Requires -RunAsAdministrator

$BootstrapPath = "$env:USERPROFILE/bootstrap-dev-machine"

Write-Output "Setting up a developer machine: this script will live in $BootstrapPath"

Invoke-RestMethod https://api.github.com/repos/jasonbot/bootstrap-windows-development-machine/zipball/main -OutFile "$env:TEMP/bootstrapdevmachine.zip"
if (Test-Path $BootstrapPath) {
    Write-Output ""
    Write-Output "> Cleaning up old bootstrapdevmachine folder..."
    Get-ChildItem -Path $BootstrapPath | Remove-Item -Recurse -Force
}
Expand-Archive "$env:TEMP/bootstrapdevmachine.zip" $BootstrapPath
Remove-Item "$env:TEMP/bootstrapdevmachine.zip"

Get-ChildItem -Path "$BootstrapPath/jasonbot-bootstrap-windows-development-machine-*" -Recurse | Move-Item -Destination $BootstrapPath

Set-Location $BootstrapPath

Invoke-RestMethod https://github.com/pirafrank/zed_unofficial_win_builds/raw/refs/heads/main/install_or_update.ps1 -OutFile "$BootstrapPath/install_zed.ps1"

.\install.ps1
Write-Output "Remember these scripts are all still available to you in: $BootstrapPath"
