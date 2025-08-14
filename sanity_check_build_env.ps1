# Set up nvm
$NvmVersion = "v22.13.1"
Write-Host "Making sure NVM is set up to use $NvmVersion"
& "$env:LOCALAPPDATA\nvm\nvm.exe" install $NvmVersion
& "$env:LOCALAPPDATA\nvm\nvm.exe" use $NvmVersion
# Node-gyp needs Python with distutils
Write-Host "Node-gyp needs a Python with setuptools installed; modern Pythons don't have it bundled"
pip install setuptools
