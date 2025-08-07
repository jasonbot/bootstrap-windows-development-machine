# Always put git in c:\git\ as a special utility
winget install --silent -e --id Git.Git --location c:\git

$packages = @(
    "Docker.DockerDesktop",
    "Google.Chrome",
    "Mozilla.Firefox",
    "Twingate.Client",
    "AgileBits.1Password",
    "Microsoft.OpenSSH.Preview",
    "Microsoft.WindowsTerminal",
    "Microsoft.VisualStudio.2019.BuildTools",
    "Microsoft.VisualStudio.2022.BuildTools",
    "Microsoft.VisualStudioCode",
    "Microsoft.WindowsSDK",
    "CoreyButler.NVMforWindows",
    "Python.Python.3.13",
    "Amazon.AWSCLI",
    "jqlang.jq",
    "MikeFarah.yq",
    "SQLite.SQLite",
    "cURL.cURL",
    "BurntSushi.ripgrep.MSVC",
    "GnuWin32.Grep",
    "GnuWin32.Zip",
    "mvdan.shfmt"
)

foreach ($package in $packages) {
    Write-Output "Installing $package..."
    winget install --silent -e --id $package
}

# These are the tools required to compile canvas in your nvm env
Invoke-WebRequest https://ftp.gnome.org/pub/GNOME/binaries/win64/gtk+/2.22/gtk+-bundle_2.22.1-20101229_win64.zip -OutFile "$env:TEMP/gtk-devenv.zip"
Expand-Archive "$env:TEMP/gtk-devenv.zip" -DestinationPath C:\GTK
Remove-Item "$env:TEMP/gtk-devenv.zip"
