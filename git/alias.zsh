# use hub if installed
# https://github.com/github/hub
command -v hub >/dev/null 2>&1 && {
  alias git=hub
}

# set some git aliases
# use gitconfig aliases
# to avoid duplication
alias ga='git a'
alias gb='git b'
alias gba='git b -a'
alias gbt='git bt'
alias gc='git c'
alias gca='git c --amend'
alias gco='git co'
alias gd='git d'
alias gdc='git d --cached'
alias gl='git l'
alias glg='git lg'
alias gr='git r -i'
alias grc='git r --continue'
alias gs='git s -sb'
alias gst='git st'
alias gstl='git st list'
alias gstsp='git st show -p'
alias gu='git undo'
