#!/usr/bin/env bash

set -euo pipefail

export HOMEBREW_NO_AUTO_UPDATE=1

# The actually installed packages
current_brewfile="$(brew bundle dump --file=- | rg '^(\w[^,]*)' -or '$1' | sort)"
# The ones that we have registered in chezmoi
stored_brewfile="$(chezmoi execute-template < .chezmoitemplates/Brewfile.tmpl | rg '^(\w[^,]*)' -or '$1' | sort)"


echo "The following diff excludes linking/service modifiers."
exec diff \
  --text \
  --side-by-side \
  --ignore-all-space \
  --ignore-blank-lines \
  --suppress-common-lines \
  --label="current" <(echo "$current_brewfile") \
  --label="stored" <(echo "$stored_brewfile")
