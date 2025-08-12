#Requires -RunAsAdministrator

Write-Host "Setting up base build/run apps"

# VS Code Build Tools
winget install --accept-source-agreements --accept-package-agreements --silent --source winget --id Microsoft.VisualStudio.2022.Community --override "--passive --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended --add Microsoft.VisualStudio.Component.Windows10SDK --add Microsoft.VisualStudio.Component.Windows11SDK.26100 --add Microsoft.VisualStudio.Component.VC.Tools.ARM64 --add Microsoft.VisualStudio.Component.VC.Modules.x86.x64 --add Microsoft.VisualStudio.Component.VC.Llvm.ClangToolset --add Microsoft.VisualStudio.Component.VC.Llvm.Clang"

$packages = @(
    "Microsoft.WindowsTerminal",
    "Google.Chrome",
    "Mozilla.Firefox",
    "Microsoft.OpenSSH.Preview",
    "Microsoft.VisualStudioCode",
    "Microsoft.WindowsSDK",
    "Microsoft.WindowsSDK.10.0.26100",
    "CoreyButler.NVMforWindows",
    "Rustlang.Rustup",
    "GoLang.Go.Unstable",
    "Python.Python.3.13",
    "jqlang.jq",
    "MikeFarah.yq",
    "SQLite.SQLite",
    "cURL.cURL",
    "BurntSushi.ripgrep.MSVC",
    "GnuWin32.Grep",
    "GnuWin32.Zip",
    "Amazon.AWSCLI"
)

foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install --accept-source-agreements --accept-package-agreements --silent -e --id $package
}

# Always put git in c:\git\ as a special location
winget install --accept-source-agreements --accept-package-agreements --silent -e --id Git.Git --location c:\git

# Run build env/nvm selectr in new Window to pick up new %PATH% etc
Start-Process powershell.exe -ArgumentList "-File .\sanity_check_build_env.ps1"

# These are the tools required to compile canvas in your nvm env
Invoke-WebRequest https://ftp.gnome.org/pub/GNOME/binaries/win64/gtk+/2.22/gtk+-bundle_2.22.1-20101229_win64.zip -OutFile "$env:TEMP/gtk-devenv.zip"
Expand-Archive "$env:TEMP/gtk-devenv.zip" -DestinationPath C:\GTK
Remove-Item "$env:TEMP/gtk-devenv.zip"


