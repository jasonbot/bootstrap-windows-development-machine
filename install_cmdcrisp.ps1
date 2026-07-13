#Requires -RunAsAdministrator

$GoModule = "github.com/jasonbot/cmdcrisp/cmd"
$Commands = @("open", "pbcopy", "pbpaste", "security")

function Install-Tool {
    param([string]$CmdName)
    $InstallCmd = "go install $GoModule/$CmdName@latest"
    Write-Host "Installing $CmdName..."
    try {
        & cmd /c $InstallCmd 2>&1 | Out-String
    } catch {
        Write-Host "ERROR installing ${CmdName}: $($_.Exception.Message)" -ForegroundColor Red
    }
}

function Add-ToUserEnvironment {
    param([string]$Directory)
    try {
        $CurrentPath = [System.Environment]::GetEnvironmentVariable("PATH", "User")
        if ($CurrentPath -match "$($Directory)") {
            Write-Host "$Directory already exists in PATH" -ForegroundColor Yellow
            return
        }

        [System.Environment]::SetEnvironmentVariable("PATH", [System.Environment]::GetEnvironmentVariable("PATH") + ";$Directory", "User")
        Write-Host "Added $($Directory) to PATH." -ForegroundColor Green
    } catch {
        Write-Host "FAILED to set User Environment Variable: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "Installing fake mac command line tools"

foreach ($cmd in $Commands) {
    Install-Tool -CmdName $cmd
}

$BinDir = "$(go env GOPATH)\bin"
Add-ToUserEnvironment -Directory $BinDir
