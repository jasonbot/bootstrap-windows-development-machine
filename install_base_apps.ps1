#Requires -RunAsAdministrator

Write-Host "Setting up base build/run apps"

https://github.com/pirafrank/zed_unofficial_win_builds/raw/refs/heads/main/install_or_update.ps1

winget install --accept-source-agreements --accept-package-agreements --silent -e --id Microsoft.UI.Xaml.2.8
winget install --skip-dependencies  --accept-source-agreements --accept-package-agreements --silent -e --id Microsoft.WindowsTerminal

$packages = @(
    "Google.Chrome",
    "Mozilla.Firefox",
    "Microsoft.OpenSSH.Preview",
    "Microsoft.WindowsTerminal",
    "Microsoft.VisualStudio.2019.BuildTools",
    "Microsoft.VisualStudio.2022.BuildTools",
    "Microsoft.VisualStudioCode",
    "Microsoft.WindowsSDK",
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

# Set up nvm
$NvmVersion = "v22.13.1"
& "$env:LOCALAPPDATA\nvm\nvm.exe" install $NvmVersion
& "$env:LOCALAPPDATA\nvm\nvm.exe" use $NvmVersion

# These are the tools required to compile canvas in your nvm env
Invoke-WebRequest https://ftp.gnome.org/pub/GNOME/binaries/win64/gtk+/2.22/gtk+-bundle_2.22.1-20101229_win64.zip -OutFile "$env:TEMP/gtk-devenv.zip"
Expand-Archive "$env:TEMP/gtk-devenv.zip" -DestinationPath C:\GTK
Remove-Item "$env:TEMP/gtk-devenv.zip"
