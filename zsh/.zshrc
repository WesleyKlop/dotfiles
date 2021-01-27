set -eo pipefail

# Profiling flag
if [[ "$ZPROF" = true ]]; then
  zmodload zsh/zprof
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/oh-my-zsh"

# Path as an array for readability
path=(
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/.composer/vendor/bin"
    "/usr/local/opt/mysql-client@5.7/bin"
    "/usr/local/opt/bash/bin"
    "/usr/local/opt/grep/libexec/gnubin"
    "/usr/local/opt/findutils/libexec/gnubin"
    "/usr/local/opt/gnu-sed/libexec/gnubin"
    "/usr/local/MacGPG2/bin"
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

# Zsh plugins to use
plugins=(git ssh-agent zsh-nvm)

# Compfix is slow so disable that
ZSH_DISABLE_COMPFIX="true"
source "$ZSH/oh-my-zsh.sh"

# Start starship
eval "$(starship init zsh)"

# Profiling end flag
if [[ "$ZPROF" = true ]]; then
  zprof
fi
