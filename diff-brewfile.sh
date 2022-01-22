#!/usr/bin/env bash

set -euo pipefail

# The actually installed packages
current_brewfile="$(brew bundle dump --file=- | rg '^\w.*' | sort)"
# The ones that we have registered in chezmoi
stored_brewfile="$(chezmoi execute-template < .chezmoitemplates/Brewfile.tmpl | rg '^\w.*' | sort)"


exec diff -wBayd \
  --suppress-common-lines \
  --label="current" <(echo "$current_brewfile") \
  --label="stored" <(echo "$stored_brewfile")
