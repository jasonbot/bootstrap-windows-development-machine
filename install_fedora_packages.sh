#! /bin/bash

# Dev toolchain
sudo dnf group install development-tools
# Extra dev tools and dependencies
sudo dnf install awscli cairo cairo-devel containerd docker-cli \
                 fzf gcc-c++ git golang jq make python3-setuptools \
                 rg shasum tcl-devel tmux vim zsh
# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash