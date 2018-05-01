# use hub if installed
# https://github.com/github/hub
command -v hub >/dev/null 2>&1 && {
  alias git=hub
}

# some git aliases
# sorted alphabetically
# use gitconfig aliases
# to avoid duplication
alias g='git'

alias ga='git a'
alias gap='git a -p'
alias gb='git b'
alias gba='git b -a'
alias gbt='git bt'

alias gc='git c'
alias gca='git c --amend'
alias gco='git co'

alias gd='git d'
alias gdc='git d --cached'
# `-R` shows additions as deletions and
# vice versa, use to see deleted whitespace
alias gdr='git d -R'
alias gdcr='git d --cached -R'

alias gl='git l'
alias glg='git lg'

alias gr='git r -i'
alias gra='git r --abort'
alias grc='git r --continue'

alias gs='git s -sb'
alias gst='git st'
alias gstl='git st list'
alias gstsp='git st show -p'

alias gu='git undo'
