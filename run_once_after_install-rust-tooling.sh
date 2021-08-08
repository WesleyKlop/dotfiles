#!/usr/bin/env bash

set -euo pipefail

packages=(
    cargo-audit
    cargo-cache
    cargo-edit
    cargo-hack
    cargo-outdated
    cargo-readme
    cargo-update
    diesel_cli
    tealdeer
)

echo "Checking for existing rust installation..."
if ! command -v cargo rustup &> /dev/null; then
    echo "Can't find cargo in \$PATH, so installing through rustup."
    curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path
else
    echo "Rust is already installed, trying to update to the latest version."
    rustup update
fi

cargo install "${packages[@]}"
