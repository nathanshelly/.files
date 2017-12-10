# shorten key delay to .2 seconds
# most important for quickly exiting
# vi insert mode
export KEYTIMEOUT=20

# map jk to esc in insert mode
bindkey -M viins 'jk' vi-cmd-mode

# change movement to home row
# hjkl -> jkl; in normal mode
bindkey -M vicmd 'j' vi-backward-char
bindkey -M vicmd 'k' down-line-or-history
bindkey -M vicmd 'l' up-line-or-history
bindkey -M vicmd ';' vi-forward-char

# reenable incremental search
bindkey -M vicmd '/' history-incremental-search-backward
