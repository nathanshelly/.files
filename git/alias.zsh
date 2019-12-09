#! /usr/bin/env zsh

# use hub if installed
# https://github.com/github/hub
command -v hub > /dev/null 2>&1 && alias git=hub

# some git aliases
# sorted alphabetically
# uses gitconfig aliases to avoid duplication
# used in constructing other aliases
alias gnp='git --no-pager'

# bases for `gl...` (git log) aliases
alias git_log_base="git log --abbrev-commit --decorate --pretty=format:'%C(cyan)%h%C(reset) - %s %C(auto)%d%C(reset)'"
alias git_log_verbose_base="git log --abbrev-commit --decorate --pretty=format:'%C(cyan)%h%C(reset) - %s %C(blue)(%cr)%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"

alias ga='git add'
# add only tracked files
alias gat='git add --update'
alias gap='git add --patch'

# base, default to verbose
alias gb='gnp branch -vv'
alias gba='gnp branch -vv --all'
alias gbd='gnp branch --delete'
alias gbD='gnp branch --delete --force'
alias gbf='gnp branch --force'
alias gbm='gnp branch --move'

alias gc='git commit'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gcl='git clone'
alias gclr='git clone --recurse'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcob='git checkout -b' # <branch>
alias gcom='git checkout master'
alias gcop='git checkout --patch'
alias gcp='git cherry-pick'

alias gd='git diff --color'
alias gdc='git diff --color --cached'
# `-R` shows additions as deletions & vice versa, use to see deleted whitespace
alias gdr='git diff --color -R'
alias gdcr='git diff --color --cached -R'

# cleanup - https://git-scm.com/docs/git-gc
alias ggc='git gc'

alias gl='git_log_base --max-count 15'
alias gln='git_log_base --max-count'
alias glp='git_log_verbose_base --patch --stat'
alias gls='git_log_verbose_base --stat --graph'
alias glsn='git_log_verbose_base --stat --graph --max-count'
alias glv='git_log_verbose_base --max-count 15'
alias glvn='git_log_verbose_base --max-count'

alias gm='git merge'

alias gpl='git pull'
alias gpla='git pull --all'
alias gps='git push'
alias gpsd='git push --dry-run'

alias gr='git rebase --interactive'
alias grn='git rebase'
alias grm='git rebase --interactive master'
alias grnm='git rebase master'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grst='git reset'

alias gs='git status --short --branch'
alias gst='git stash'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstsp='git stash show --patch'

alias gu='git reset HEAD~'

# aliases to avoid `--no-pager` default
# uses `gwp<command>` ("with pager" mnemonic) to avoid `--no-pager`
alias gwpl='glbase'
alias gwplv='glvbase'
