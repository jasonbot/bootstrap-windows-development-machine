#Requires -RunAsAdministrator

$BootstrapPath = "$env:TEMP/bootstrapdevmachine"

Write-Output "Setting up a developer machine: this script will live in $BootstrapPath"

Invoke-RestMethod https://api.github.com/repos/jasonbot/bootstrap-windows-development-machine/zipball/main -OutFile "$env:TEMP/bootstrapdevmachine.zip"
if (Test-Path $BootstrapPath) {
    Write-Output ""
    Write-Output "> Cleaning up old bootstrapdevmachine folder..."
    Get-ChildItem -Path $BootstrapPath | Remove-Item -Recurse -Force
}
Expand-Archive "$env:TEMP/bootstrapdevmachine.zip" $BootstrapPath
Remove-Item "$env:TEMP/bootstrapdevmachine.zip"

Get-ChildItem -Path "$env:TEMP/bootstrapdevmachine/jasonbot-bootstrap-windows-development-machine-*" -Recurse | Move-Item -Destination $BootstrapPath

Set-Location $BootstrapPath

.\install.ps1