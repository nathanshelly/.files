# use hub if installed
# https://github.com/github/hub
command -v hub > /dev/null 2>&1 && {
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
alias gbd='git b -d'
alias gbD='git b -D'
alias gbf='git b -f'
alias gbm='git b -m'
alias gbt='git bt'

alias gc='git c'
alias gca='git c --amend'
alias gcan='git c --amend --no-edit'
alias gcm='git c -m'
alias gco='git co'
alias gcob='git co -b'
alias gcom='git co master'
alias gcp='git cherry-pick'

alias gd='git d'
alias gdc='git d --cached'
# `-R` shows additions as deletions and
# vice versa, use to see deleted whitespace
alias gdr='git d -R'
alias gdcr='git d --cached -R'

alias gl='git l'
alias glp='git lv -p'
alias glps='git lv -p --stat'
alias gls='git lv --stat'
alias glv='git lv'

alias gm='git m'

alias gr='git ri'
alias gra='git r --abort'
alias grc='git r --continue'
alias grst='git reset'

alias gs='git s -sb'
alias gst='git st'
alias gsta='git st apply'
alias gstl='git st list'
alias gstp='git st pop'
alias gstsp='git st show -p'

alias gu='git undo'
