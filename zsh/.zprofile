#########
# Aliases
#########

alias dirs="dirs -v"

alias artisan="php artisan"

#############
# Environment
#############

export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

export EDITOR="/usr/bin/vim"
export VISUAL="$EDITOR"

export GPG_TTY="$(tty)"

export NPM_PACKAGES="$HOME/.local/node_modules"

export MANPATH="$NPM_PACKAGES/share/man:$MANPATH"

export LANG=en_US.UTF-8

# Less colors
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
