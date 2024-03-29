setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
setopt inc_append_history     # Directly add to history instead of on shell exit
setopt hist_find_no_dups      # Do not find duplicates


