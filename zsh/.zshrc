# Profiling flag
if [[ "$ZPROF" = true ]]; then
  zmodload zsh/zprof
fi

# Load antigen
export ADOTDIR="$HOME/.local/antigen"
source "$HOME/.local/dotfiles/antigen.zsh"

# Rust configuration
export RUSTUP_HOME="$HOME/.local/rustup"
export CARGO_HOME="$HOME/.local/cargo"
export COMPOSER_HOME="$HOME/.config/composer"
export GPG_TTY="$(tty)"

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
antigen use oh-my-zsh

antigen bundle git
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa_inthere
antigen bundle ssh-agent
antigen bundle zsh-nvm
antigen bundle gpg-agent
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# Load iTerm2 shell integration
source "$HOME/.local/dotfiles/iterm2_shell_integration.zsh" || true

# Start starship
eval "$(starship init zsh)"

# Profiling end flag
if [[ "$ZPROF" = true ]]; then
  zprof
fi


