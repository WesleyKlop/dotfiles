#!/usr/bin/env bash

# If we are on mac, we should install xcode cli tools.
case "$OSTYPE" in
    darwin*)
        echo "On MacOS we need xcode tooling..."
        xcode-select --install
        ;;
    linux*)
        echo "On Linux we need... Nothing?"
        ;;
esac

CHEZMOI="$HOME/.local/bin/chezmoi"
CHEZMOI_DIR="$(dirname "$CHEZMOI")"

if command -v chezmoi; then
    CHEZMOI="$(command -v chezmoi)"
    CHEZMOI_DIR="$(dirname "$CHEZMOI")"
else
    mkdir -p "$CHEZMOI_DIR"
    sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$CHEZMOI_DIR"
fi

"$CHEZMOI" init --apply --ssh WesleyKlop
