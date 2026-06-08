#!/usr/bin/env bash

if [ "$(uname)" = "Linux" ]; then
    sudo apt install -y git
else
    if ! xcode-select -p >/dev/null 2>&1; then
        xcode-select --install
        read -rp "Install git via the Command Line Tools, then press Enter to continue..."
    fi
fi

git clone https://github.com/khzs/dotfiles-core.git ~/.config/dotfiles-core
source ~/.config/dotfiles-core/one-time-setup-$(uname).sh
