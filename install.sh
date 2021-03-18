#!/usr/bin/env bash

set -euo pipefail

echo "Sourcing zprofile for required variables"

source ./zsh/.zprofile

echo "Installing required packages"

ZSH_NVM="$ZSH/custom/plugins/zsh-nvm"
if [ ! -d "$ZSH_NVM" ]; then
	git clone https://github.com/lukechilds/zsh-nvm "$ZSH_NVM"
fi

echo "Installing dotfiles using stow."

stow -t "$HOME" git gpg ssh tmux vim zsh

echo "Dotfiles installed, enjoy!"
