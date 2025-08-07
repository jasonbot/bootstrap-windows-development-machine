Write-Output "Installing Inter and Jetbrains Mono"

function Install-Font {
    param {
        $Font
    }
    Write-Host 'Installing font -' $Font.BaseName
    Copy-Item $Font "C:\Windows\Fonts"
    New-ItemProperty -Name $Font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name         
}

Invoke-RestMethod https://github.com/rsms/inter/releases/download/v4.1/Inter-4.1.zip -OutFile "$env:TEMP/inter.zip"
Expand-Archive "$env:TEMP/inter.zip" "$env:TEMP/inter"
$FontList = Get-ChildItem -Path "$env:TEMP/inter" -Include ('*.ttc') -Recurse
foreach ($Font in $FontList) {
    Install-Font -Font $Font
}
Remove-Item -Recurse "$env:TEMP/inter"
Remove-Item "$env:TEMP/inter.zip"

Invoke-RestMethod https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip -OutFile "$env:TEMP/jetbrainsmono.zip"
Expand-Archive "$env:TEMP/jetbrainsmono.zip" "$env:TEMP/jetbrainsmono"

$FontList = Get-ChildItem -Path "$env:TEMP/jetbrainsmono" -Include ('*.fon', '*.otf', '*.ttc', '*.ttf') -Recurse
foreach ($Font in $FontList) {
    Install-Font -Font $Font
}

Remove-Item -Recurse "$env:TEMP/jetbrainsmono"
Remove-Item "$env:TEMP/jetbrainsmono.zip"
