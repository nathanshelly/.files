#! /usr/bin/env zsh

# this file uses `zinit` to manage `zsh` plugins
#
# refs:
# - https://github.com/zdharma-continuum/zinit/
# - https://github.com/zdharma-continuum/zinit/wiki

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
# - https://github.com/zdharma-continuum/zinit#ice-modifiers

zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# note: any plugins that define widgets the syntax highlighting might need to
# color (such as `zsh-autosuggestions`) must be loaded prior
# ref - search fast-syntax-highlighting
#
# TODO: try enabling asynchronous loading once
# zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

# synchronize system clipboard
# theoretically you might need to source this after other keymappings, have not
# yet seen a need for enforcing that
zinit ice wait lucid
zinit light kutsan/zsh-system-clipboard

# similar to `jk/`, convenient when query already typed out
# ref - https://github.com/zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-history-substring-search

# prompt
# ref - https://github.com/romkatv/powerlevel10k#zinit
zinit ice depth=1
zinit light romkatv/powerlevel10k

command -v lua > /dev/null && {
  # quickly `cd` to folders based on frequency and recency of access
  zinit ice wait lucid
  zinit light skywind3000/z.lua
}

# TODO: understand weird behavior I'm seeing with this
zinit light Aloxaf/fzf-tab

# suggests aliases when a matching command is run
zinit light MichaelAquilina/zsh-you-should-use

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end of plugins >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# <<<<<<<<<<<<<<<<<<<<<<<<<<< start of plugin config >>>>>>>>>>>>>>>>>>>>>>>>>>>

# <<<< autosuggestions >>>>
# ref - https://github.com/zsh-users/zsh-autosuggestions#configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244' # light grey
ZSH_AUTOSUGGEST_USE_ASYNC=true # can be set to anything

# << keymappings >>
# ref - https://github.com/zsh-users/zsh-autosuggestions#key-bindings

# accept until end of line (same as right arrow)
# note: this matches default behavior in emacs binding mode  as `^e` is bound to
# `end-of-line` widget which triggers acceptance
bindkey '^e' autosuggest-accept
# accept until end of line and immediately execute
bindkey '^ ' autosuggest-execute
# accept next word (overrides `backward-kill-word` in emacs binding mode)
bindkey '^w' vi-forward-word

# <<<< history-substring-search >>>>

# << keymappings >>
bindkey '^u' history-substring-search-up
bindkey '^y' history-substring-search-down

# <<<< fzf-tab >>>>
# ref - https://github.com/Aloxaf/fzf-tab/wiki/Configuration

# override '/` default
zstyle ':fzf-tab:*' continuous-trigger '+'

# <<<<<<<<<<<<<<<<<<<<<<<<<<<< end of plugin config >>>>>>>>>>>>>>>>>>>>>>>>>>>>
