#!/usr/bin/env bash

set -eu

# If we are on mac, we should install xcode cli tools.
case "$OSTYPE" in
    darwin*)
        echo "On MacOS we need xcode tooling..."
        xcode-select --install || true
	echo "Installing brew if needed..."
	if ! command -v brew &> /dev/null; then
    		echo "Brew not found... installing!"
    		bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
	# Rest of the script can now utilize brew
	eval "$(/opt/homebrew/bin/brew shellenv)"
	brew install --cask gpg-suite-no-mail 1password 1password/tap/1password-cli

	echo "Use this moment to configure 1password..."
	open "/Applications/1Password.app"
	read -n 1
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
