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

# Plugin config
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# Plugin bundles
antigen bundle git
antigen bundle gpg-agent
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


