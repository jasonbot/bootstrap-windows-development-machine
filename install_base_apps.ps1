#Requires -RunAsAdministrator

Write-Host "Setting up base build/run apps"

# Developer mode
New-ItemProperty -Path "HKLM:\SYSTEM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" -Name "AllowDevelopmentWithoutDevLicense" -Value 1 -PropertyType DWORD -Force
# Long paths
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force

# VS Code Build Tools
winget install --accept-source-agreements --accept-package-agreements --silent --source winget --id Microsoft.VisualStudio.2022.Community --override "--passive --add  --add Microsoft.VisualStudio.Component.VC.14.44.17.14.ARM64 Microsoft.VisualStudio.Component.VC.14.44.17.14.x86.x64 --add Microsoft.VisualStudio.Component.VC.ATL.ARM64.Spectre  --add Microsoft.VisualStudio.Component.VC.ATL.Spectre  --add Microsoft.VisualStudio.Component.VC.ATLMFC.Spectre --add Microsoft.VisualStudio.Component.VC.MFC.ARM64.Spectre --add Microsoft.VisualStudio.Component.VC.Modules.x86.x64  --add Microsoft.VisualStudio.Component.VC.Runtimes.ARM64.Spectre  --add Microsoft.VisualStudio.Component.VC.Runtimes.x86.x64.Spectre  --add Microsoft.VisualStudio.Component.VC.Tools.ARM64  --add Microsoft.VisualStudio.Component.Windows10SDK  --add Microsoft.VisualStudio.Component.Windows10SDK.20348  --add Microsoft.VisualStudio.Component.Windows11SDK.22621  --add Microsoft.VisualStudio.Component.Windows11SDK.22621  --add Microsoft.VisualStudio.Component.Windows11SDK.26100  --add Microsoft.VisualStudio.Workload.VCTools"

$packages = @(
    "Microsoft.WindowsTerminal",
    "Google.Chrome",
    "Mozilla.Firefox",
    "Microsoft.OpenSSH.Preview",
    "Microsoft.VisualStudioCode",
    "Microsoft.WindowsSDK",
    "Microsoft.WindowsSDK.10.0.26100",
    "CoreyButler.NVMforWindows",
    "Microsoft.Sysinternals.Suite",
    "Microsoft.WinDbg",
    "Rustlang.Rustup",
    "GoLang.Go",
    "Python.Python.3.14",
    "astral-sh.uv",
    "RubyInstallerTeam.Ruby.3.4",
    "jqlang.jq",
    "MikeFarah.yq",
    "SQLite.SQLite",
    "cURL.cURL",
    "BurntSushi.ripgrep.MSVC",
    "GnuWin32.Grep",
    "GnuWin32.Zip",
    "direnv.direnv",
    "mvdan.shfmt",
    "TerraformLinters.tflint",
    "ImageMagick.ImageMagick",
    "JesseDuffield.lazygit",
    "JesseDuffield.Lazydocker",
    "skardyy.mcat",
    "Amazon.AWSCLI",
    "ZedIndustries.Zed",
    "Microsoft.WinAppCli",
    "LLVM.ClangFormat"
)

foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install --accept-source-agreements --accept-package-agreements --silent -e --id $package
}

# Always put git in c:\git\ as a special location
winget install --accept-source-agreements --accept-package-agreements --silent -e --id Git.Git --location c:\git

# Run build env/nvm select in new window to pick up new %PATH% etc
Start-Process powershell.exe -ArgumentList "-File $PSScriptRoot\sanity_check_build_env.ps1"
# Run again on next boot *just in case*
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce" -Name $(New-Guid) -Value "powershell.exe -ExecutionPolicy Bypass -File '$PSScriptRoot\sanity_check_build_env.ps1'"

# These are the tools required to compile canvas in your nvm env
Invoke-WebRequest https://ftp.gnome.org/pub/GNOME/binaries/win64/gtk+/2.22/gtk+-bundle_2.22.1-20101229_win64.zip -OutFile "$env:TEMP\gtk-devenv.zip"
Expand-Archive "$env:TEMP\gtk-devenv.zip" -DestinationPath C:\GTK
Remove-Item "$env:TEMP\gtk-devenv.zip"
