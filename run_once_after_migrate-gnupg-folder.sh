#!/usr/bin/env bash

if [ -d "$HOME/.gnupg" ]; then
    mv "$HOME/.gnupg" "$GNUPGHOME"
else
    echo "GnuPG folder already migrated or not found."
fi
