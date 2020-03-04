# Path to your oh-my-zsh installation.
export ZSH="/home/wesley/.oh-my-zsh"

export PATH="$HOME/.cargo/bin:$PATH"

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
