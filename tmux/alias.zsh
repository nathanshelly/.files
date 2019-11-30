#! /usr/bin/env zsh

alias tmux='tmux -2u'
# launch w/o sourcing configs (`-f file` specifies config files)
alias tmuxn='tmux -f /dev/null'

alias tk='tmux kill-session -t'
alias tl='tmux ls'

# << tmuxinator >>
alias mux='tmuxinator'
