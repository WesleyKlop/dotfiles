#!/usr/bin/env bash

set -eo pipefail

echo "Installing dotfiles using stow."

stow -t "$HOME" git gpg ssh tmux vim zsh

echo "Dotfiles installed, enjoy!"
