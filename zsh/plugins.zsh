#! /usr/bin/env zsh

# this file uses `zinit` to manage `zsh` plugins
#
# refs:
# - http://zdharma.org/zinit/wiki/INTRODUCTION/
# - https://github.com/zdharma/zinit#zinit-wiki

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< start of plugins >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# `zinit` has a concept called ice modifiers which applies single-use
# modifiers to the next loaded plugin.
#
# the `ice` name communicates that the modifiers last for only the next zinit
# command
#
# here are the modifiers used in this file:
#
# - wait - load asynchronously
# - atload - command to run when the plugin finishes loading
# - lucid - skip `Loaded ...` message
#
# refs:
# - https://github.com/zdharma/zinit#ice-modifiers
# - http://zdharma.org/zinit/wiki/INTRODUCTION/#some_ice-modifiers

# ref - search zsh-autosuggestions
# http://zdharma.org/zinit/wiki/GALLERY/#plugins
zinit ice wait lucid atload'!_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# note: any plugins that define widgets the syntax highlighting might need to
# color (such as `zsh-autosuggestions`) must be loaded prior
# ref - search fast-syntax-highlighting
# http://zdharma.org/zinit/wiki/GALLERY/#plugins
zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# similar to `jk/`, convenient when query already typed out
# ref - https://github.com/zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-history-substring-search

# prompt
# ref - https://github.com/romkatv/powerlevel10k#zinit
zinit ice depth=1
zinit light romkatv/powerlevel10k
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end of plugins >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# <<<<<<<<<<<<<<<<<<<<<<<<<<< start of plugin config >>>>>>>>>>>>>>>>>>>>>>>>>>>

# <<<< syntax highlighting >>>>
# refs:
# - https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
# - https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[comment]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

# <<<< autosuggestions >>>>
# ref - https://github.com/zsh-users/zsh-autosuggestions#configuration

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244' # light grey
ZSH_AUTOSUGGEST_USE_ASYNC=true # can be set to anything

# in the future consider testing `completion` strategy on feature branch
# ref - https://github.com/zsh-users/zsh-autosuggestions/compare/features/completion-suggestions
ZSH_AUTOSUGGEST_STRATEGY=(history)

# << keymappings >>
# ref - https://github.com/zsh-users/zsh-autosuggestions#key-bindings

# accept until end of line (same as right arrow)
bindkey '^e' autosuggest-accept
# accept until end of line and immediately execute
bindkey '^ ' autosuggest-execute
# accept next word
bindkey '^w' vi-forward-word

# <<<< history-substring-search >>>>

# << keymappings >>
bindkey '^u' history-substring-search-up
bindkey '^y' history-substring-search-down
# <<<<<<<<<<<<<<<<<<<<<<<<<<<< end of plugin config >>>>>>>>>>>>>>>>>>>>>>>>>>>>
