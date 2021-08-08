#!/usr/bin/env bash

if [ -d "$HOME/.gnupg" ]; then
    killall gpg-agent
    mv "$HOME/.gnupg" "${GNUPGHOME-$HOME/.local/gnupg}"
else
    echo "GnuPG folder already migrated or not found."
fi
