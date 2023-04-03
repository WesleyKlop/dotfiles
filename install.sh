#!/usr/bin/env bash

set -eu

# If we are on mac, we should install xcode cli tools.
case "$OSTYPE" in
darwin*)
    echo "On MacOS we need xcode tooling..."
    xcode-select --install || true
    echo "Installing brew if needed..."
    if ! command -v brew &>/dev/null; then
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
    echo "Checking for existence of op-cli..."
    if ! command -v op &>/dev/null; then
        echo "op-cli not found..."
        if ! command -v apt-get &>/dev/null; then
            echo "I only know how to install op-cli on debian based systems..."
            echo "Come back when you installed it manually."
            echo "Maybe check: https://developer.1password.com/docs/cli/get-started/#install"
            exit 1
        fi

        curl -sS https://downloads.1password.com/linux/keys/1password.asc |
            sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
            sudo tee /etc/apt/sources.list.d/1password.list
        sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
        curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol |
            sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
        sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
        curl -sS https://downloads.1password.com/linux/keys/1password.asc |
            sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
        sudo apt update && sudo apt install 1password-cli
    fi

    echo "Checking for existence of the account we use."
    if ! op account list | grep -q 'GIFANVXR5RGWZE5T2QIURRYYPE'; then
        echo "Account not found, please login to 1password and add the account."
        echo "Then come back and run this script again."
        exit 1
    fi

    should_kill_agent=false
    echo "Checking for registered keys in your ssh agent to access github..."
    if [ -z ${SSH_AGENT_PID:-} ] || ! ps -p "$SSH_AGENT_PID" >/dev/null; then
        echo "ssh-agent is not running, so starting a temporary one..."
        eval "$(ssh-agent -s)"
        should_kill_agent=true
    fi
    if [ "$should_kill_agent" = true ]; then
        trap 'kill "$SSH_AGENT_PID"' EXIT
    fi
    if ! ssh-add -L >/dev/null; then
        echo "No keys found in your ssh agent. Pulling one from 1Password:"
        read -r -p "Enter the uuid of the key you want to use: " keyid
        op read "op://personal/$keyid/private key" | ssh-add -
    fi
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
export GPG_TTY=$(tty)
"$CHEZMOI" init --apply --ssh WesleyKlop
