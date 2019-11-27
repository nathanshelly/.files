#! /usr/bin/env zsh

alias tmux='tmux -2u'
# launch w/o sourcing configs (`-f file` specifies config files)
alias tmuxn='tmux -f /dev/null'

alias ta='tmux attach -t' # `-t <target-[client|session|window|pane]>`
alias tk='tmux kill-session -t'
alias tl='tmux ls'
alias tn='tmux new -s' # `-s <session-name>`

# << tmuxinator >>
alias mux='tmuxinator'
