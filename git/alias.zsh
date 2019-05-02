# use hub if installed
# https://github.com/github/hub
command -v hub > /dev/null 2>&1 && alias git=hub

# some git aliases
# sorted alphabetically
# uses gitconfig aliases to avoid duplication
alias g='git'
# used in constructing other aliases
alias gnp='git --no-pager'

alias ga='git a'
# add only tracked files
alias gat='git a --update'
alias gap='git a --patch'

# base, default to verbose
alias gb='git b -vv'
alias gba='gb --all'
# non-verbose
alias gbas='git b --all'
alias gbd='git b --delete'
alias gbD='git b --delete --force'
alias gbf='git b --force'
# using `-P` w/ `branch` by default
# this alias provides bare git behavior
alias gbl='git branch'
alias gbm='git b --move'
# non-verbose
alias gbs='git b'
alias gbt='git bt'
alias gbv='git b -vv'

alias gc='git c'
alias gca='git c --amend'
alias gcan='git c --amend --no-edit'
alias gcl='git clone'
alias gclr='git clone --recurse'
alias gcm='git c --message'
alias gco='git co'
alias gcob='git co -b' # `-b <branch>`
alias gcom='git co master'
alias gcop='git co --patch'
alias gcp='git cherry-pick'

alias gd='git d'
alias gdc='git d --cached'
# `-R` shows additions as deletions & vice versa, use to see deleted whitespace
alias gdr='git d -R'
alias gdcr='git d --cached -R'

# cleanup - https://git-scm.com/docs/git-gc
alias ggc='git gc'

alias gl='gnp ln 15'
alias gln='gnp ln'
alias glp='git lv --patch'
alias glps='git lv --patch --stat'
alias gls='git lv --stat'
alias glsn='git lv --stat --max-count'
alias glv='gnp lvn 15'
alias glvn='gnp lvn'

alias gm='git m'

# << assorted aliases using `--no-pager` (`gnp`) >>
# not a comprehensive list of aliases using `--no-pager`
# could set option in future (`git config --global pager.<command> <bool>`)
# ref - https://stackoverflow.com/a/18129365
alias gnpd='gnp d'
alias gnpdc='gnp d --cached'
alias gnpls='gnp lvn 5 --stat'

alias gpl='git pull'
alias gpla='git pull --all'
alias gps='git push'
alias gpsd='git push --dry-run'

alias gr='git ri'
alias grm='git ri master'
alias gra='git r --abort'
alias grc='git r --continue'
alias grst='git reset'

alias gs='git s --short --branch'
alias gst='git st'
alias gsta='git st apply'
alias gstl='git st list'
alias gstp='git st pop'
alias gstsp='git st show --patch'

alias gu='git undo'

# aliases to avoid `--no-pager` default
# uses `gwp<command>` ("with pager" mnemonic) to avoid `--no-pager`
alias gwpl='git l'
alias gwplv='git lv'

# TODO: add function aliases (from $DOTFILES/functions/_git_functions) for
# discoverability
