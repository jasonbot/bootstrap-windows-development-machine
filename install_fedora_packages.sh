#! /bin/bash

# Dev toolchain
sudo dnf group install -y development-tools
# Extra dev tools and dependencies
sudo dnf install -y awscli cairo cairo-devel containerd docker-cli \
                    fzf gcc-c++ git golang jq make python3-setuptools \
                    ripgrep shasum tcl-devel tmux vim zsh git golang \
                    ImageMagick rust

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

## TFEnv and add some stuff to your profile to run it
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
cat << END  >>.bashrc
export PATH="\$HOME/.tfenv/bin:\$PATH"
END
