#!/usr/bin/env bash

set -euo pipefail

echo "Upgrading chezmoi"
chezmoi upgrade

echo "Installing vim plugins"
mkdir -p "$HOME/.local/vim/bundle"

if [ ! -d "$HOME/.local/vim/bundle/Vundle.vim" ]; then
    # Vundle for vim plugins
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.local/vim/bundle/Vundle.vim"
else
    pushd "$HOME/.local/vim/bundle/Vundle.vim"
    git pull
    popd
fi

vim +PluginInstall +qall

echo "Setting up rust"

packages=(
    cargo-audit
    cargo-cache
    cargo-edit
    cargo-hack
    cargo-outdated
    cargo-readme
    cargo-update
    tealdeer
)

echo "Checking for existing rust installation..."
if ! command -v cargo rustup &> /dev/null; then
    echo "Can't find cargo in \$PATH, so installing through rustup."
    curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y
else
    echo "Rust is already installed, trying to update to the latest version."
    rustup update
fi

cargo install "${packages[@]}"
cargo install diesel_cli --no-default-features --features postgres
