#!/usr/bin/env bash

set -euo pipefail

echo "Installing antigen"

curl -Lo antigen.zsh https://git.io/antigen

echo "Sourcing zprofile for required variables"

source ./zsh/.zprofile

echo "Installing dotfiles using stow."

stow -t "$HOME" git gpg ssh tmux vim zsh scripts

echo "Dotfiles installed, enjoy!"
