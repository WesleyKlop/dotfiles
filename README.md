# Dotfiles

These are my dotfiles. It contains the universal configuration utilized in all
my Unix environments as well as MacOS. 

## Installation

Just execute this random script from the internet! What could go wrong.

**WARNING**: Before installation you should make sure you have the required gpg private key available as well as an ssh key that can access github.

```bash
sh -c "$(curl -fsSL 'https://raw.githubusercontent.com/WesleyKlop/dotfiles/main/install.sh')"
```

The script will check if you have all required software installed. For now this
is only xcode on macos. After that it will setup Chezmoi and install the dotfiles!

## Configuration

I have a few configuration options available. You can find the configuration file in `$HOME/.config/chezmoi/chezmoi.toml`. It contains options for the installation of different toolchains but also databases and ssh agents.
