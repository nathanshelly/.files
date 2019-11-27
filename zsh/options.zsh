#! /usr/bin/env zsh

# ref - http://zsh.sourceforge.net/Doc/Release/Options.html

# beta testing
setopt hist_find_no_dups

# cd
setopt auto_cd

# completion
setopt complete_in_word no_list_beep complete_aliases

# expansion & globbing
setopt extended_glob no_match

# history
setopt hist_ignore_all_dups hist_reduce_blanks share_history hist_verify

# input
setopt no_correct

# job control
setopt no_bg_nice no_hup notify

# prompting
setopt prompt_subst

# scripts & functions
setopt local_options local_traps

# zle
setopt no_beep

# allow comments in zle
setopt interactive_comments
