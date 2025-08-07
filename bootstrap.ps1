#Requires -RunAsAdministrator

Invoke-RestMethod https://api.github.com/repos/jasonbot/bootstrap-windows-development-machine/zipball/main -OutFile "$env:TEMP/bootstrapdevmachine.zip"
if (Test-Path "$env:TEMP/bootstrapdevmachine") {
    Write-Output ""
    Write-Output "> Cleaning up old bootstrapdevmachine folder..."
    Get-ChildItem -Path "$env:TEMP/bootstrapdevmachine" -Exclude CustomAppsList, SavedSettings, bootstrapdevmachine.log | Remove-Item -Recurse -Force
}
Expand-Archive "$env:TEMP/bootstrapdevmachine.zip" "$env:TEMP/bootstrapdevmachine"
Remove-Item "$env:TEMP/bootstrapdevmachine.zip"

Get-ChildItem -Path "$env:TEMP/bootstrapdevmachine/jasonbot-bootstrap-windows-development-machine-*" -Recurse | Move-Item -Destination "$env:TEMP/bootstrapdevmachine"