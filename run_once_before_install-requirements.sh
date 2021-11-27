#!/usr/bin/env bash

set -eux

IS_MACOS=0
IS_LINUX=0
IS_WINDOWS=0
echo "Determening os type..."
case "$OSTYPE" in
    darwin*)
        IS_MACOS=1
    ;;
    linux*)
        IS_LINUX=1
    ;;
esac

echo "Installing antigen for zsh..."
mkdir -p "$HOME/.local/antigen"
curl -o "$HOME/.local/antigen/antigen.zsh" -L https://git.io/antigen

if [ $IS_MACOS == 1 ]; then
    echo "Installing brew if needed..."
    if ! command -v brew &> /dev/null; then
        echo "Brew not found... installing!"
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    # Rest of the script can now utilize brew
    eval "$(/opt/homebrew/bin/brew shellenv)"

    echo "Installing rosetta..."
    sudo softwareupdate --install-rosetta
fi

echo "Installing gpg if needed..."
if ! command -v gpg &> /dev/null; then
   if [ $IS_MACOS -eq 1 ]; then
        brew install --cask gpg-suite 
   elif [ $IS_LINUX -eq 1 ]; then
        sudo apt install gpg # This should be nicer...
   fi
fi

echo "Finished!"
