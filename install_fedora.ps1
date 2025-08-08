#Requires -RunAsAdministrator

wsl --install FedoraLinux-42
wsl --set-default FedoraLinux-42
wsl --exec "bash ./install_fedora_packages.sh"