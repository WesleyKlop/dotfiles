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

# Install and apply chezmoi config.
sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$HOME/.local/bin" init --apply --ssh WesleyKlop
