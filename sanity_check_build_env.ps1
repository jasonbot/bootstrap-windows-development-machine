# Set up nvm
$NvmVersion = "v22.13.1"
& "$env:LOCALAPPDATA\nvm\nvm.exe" install $NvmVersion
& "$env:LOCALAPPDATA\nvm\nvm.exe" use $NvmVersion
# Node-gyp needs Python with distutils
pip install setuptools
