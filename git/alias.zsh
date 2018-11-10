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
alias gp='git --no-pager'

alias ga='git a'
alias gap='git a -p'

alias gb='git b'
alias gba='git b -a'
alias gbd='git b -d'
alias gbD='git b -D'
alias gbf='git b -f'
# using `-P` w/ `branch` by default
# this alias provides the bare git behavior
alias gbl='git branch'
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

alias gl='gp ln 15'
alias gln='gp ln'
alias glp='git lv -p'
alias glps='git lv -p --stat'
alias gls='git lv --stat'
alias glsn='git lvn --stat'
alias glv='gp lvn 15'
alias glvn='gp lvn'

alias gm='git m'

# aliases using `--no-pager` (`gp`)
# not a comprehensive list of aliases using `--no-pager`
alias gpd='gp d'
alias gpdc='gp d --cached'
alias gpls='gp lvn 5 --stat'

# aliases to avoid `--no-pager` default
# uses `gp<command>` to avoid `--no-pager`
# unfortunate confusing shadowing of aliases using `gp` for no pagination
alias gpl='g l'
alias gplv='g lv'

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
