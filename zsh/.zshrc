# Profiling flag
if [[ "$ZPROF" = true ]]; then
  zmodload zsh/zprof
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/oh-my-zsh"

# Rust configuration
export RUSTUP_HOME="$HOME/.local/rustup"
export CARGO_HOME="$HOME/.local/cargo"
export COMPOSER_HOME="$HOME/.config/composer"

# Path as an array for readability
path=(
    "$CARGO_HOME/bin"
    "$COMPOSER_HOME/vendor/bin"
    "/usr/local/opt/bash/bin"
    "/usr/local/opt/grep/libexec/gnubin"
    "/usr/local/opt/findutils/libexec/gnubin"
    "/usr/local/opt/gnu-sed/libexec/gnubin"
    "/usr/local/MacGPG2/bin"
    "$HOME/.local/bin"
    "/usr/local/bin"
    "/usr/bin"
    "/bin"
    "/usr/sbin"
    "/sbin"
)
export PATH=$(IFS=":"; echo "${path[*]}")

# Zsh plugin configuration
export NVM_LAZY_LOAD=true
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa_inthere id_rsa_polaris

# Zsh plugins to use
plugins=(git ssh-agent zsh-nvm)

# Compfix is slow so disable that
ZSH_DISABLE_COMPFIX="true"
source "$ZSH/oh-my-zsh.sh"

# Load iTerm2 shell integration
source "$HOME/.local/dotfiles/iterm2_shell_integration.zsh" || true

# Start starship
eval "$(starship init zsh)"

# Profiling end flag
if [[ "$ZPROF" = true ]]; then
  zprof
fi


