#! /usr/bin/env zsh

# add back initizialization of compinit
autoload -U compinit
compinit

# case insensitive completion
# ref - https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directorys-and
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# `yes` - select first item on initial tab
# `select` - highlight options in tab-complete
zstyle ':completion:*' menu yes select

# use LS_COLORS for zsh completions
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
