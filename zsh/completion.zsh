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

# enable completions for homebrew-installed programs
# TODO: fix whatever's not working here
# ref - https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
command -v brew > /dev/null && fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)
