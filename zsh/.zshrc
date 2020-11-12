# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/oh-my-zsh"

export PATH="/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

plugins=(git docker nvm ssh-agent)

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa_inthere id_rsa_swis

source "$ZSH/oh-my-zsh.sh"

eval "$(starship init zsh)"
