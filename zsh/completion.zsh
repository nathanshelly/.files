#! /usr/bin/env zsh

# case insensitive completion
# ref - https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directorys-and
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# enable completions for homebrew-installed programs
# TODO: fix whatever's not working here
# ref - https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
command -v brew > /dev/null && fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)
