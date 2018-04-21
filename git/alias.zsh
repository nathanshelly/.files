# use hub if installed
# https://github.com/github/hub
command -v hub >/dev/null 2>&1 && {
  alias git=hub
}

# set some git aliases
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gbt='git bt'
alias gc='git commit'
alias gca='git commit --amend'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git l'
alias glg='git lg'
alias gr='git rebase -i'
alias grc='git rebase --continue'
alias gs='git status -sb'
alias gst='git stash'
alias gu='git undo'
