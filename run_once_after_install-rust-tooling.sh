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
