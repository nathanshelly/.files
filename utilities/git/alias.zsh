#! /usr/bin/env zsh

"$DOTFILES/infra/scripts/component_enabled.sh" 'git-aliases' || return 0

alias ga='git add'
# add only tracked files
alias gat='git add --update'
alias gap='git add --patch'

# used in below aliases
alias gnp='git --no-pager'
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
alias gcop='git checkout --patch'
alias gcp='git cherry-pick'

alias gd='git diff --color'
alias gdc='git diff --color --cached'
# `-R` shows additions as deletions & vice versa, use to see deleted whitespace
alias gdr='git diff --color -R'
alias gdcr='git diff --color --cached -R'

# cleanup - https://git-scm.com/docs/git-gc
alias ggc='git gc'

# bases for `gl...` (git log) aliases
alias git_log_base="git log --abbrev-commit --decorate --pretty=format:'%C(cyan)%h%C(reset) - %s %C(auto)%d%C(reset)'"
alias git_log_verbose_base="git log --abbrev-commit --decorate --pretty=format:'%C(cyan)%h%C(reset) - %s %C(blue)(%cr)%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"

alias gl='git_log_base --max-count 15'
alias gln='git_log_base --max-count'
alias glp='git log --patch --stat'
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
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grst='git reset'
# reset all changes, including untracked files
alias grstf='git reset --hard && git clean -d --force' # `-d` - recurse

alias gs='git status --short --branch'
alias gst='git stash'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstsp='git stash show --patch'

alias gu='git reset HEAD~'

# aliases to avoid `--no-pager` default
# uses `gwp<command>` ("with pager" mnemonic) to avoid `--no-pager`
alias gwpl='git_log_base'
alias gwplv='git_log_verbose_base'
