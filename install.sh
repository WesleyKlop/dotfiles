#!/usr/bin/env bash

set -euo pipefail

echo "Installing required packages"

git clone https://github.com/lukechilds/zsh-nvm "$ZSH_CUSTOM/plugins/zsh-nvm"

echo "Installing dotfiles using stow."

stow -t "$HOME" git gpg ssh tmux vim zsh

echo "Dotfiles installed, enjoy!"
