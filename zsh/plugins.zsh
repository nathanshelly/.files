# this file uses `zplugin` to manage `zsh` plugins
#
# refs:
# - http://zdharma.org/zplugin/wiki/INTRODUCTION/
# - https://github.com/zdharma/zplugin#zplugin-wiki

# install `zplugin` if not already installed
# ref - https://github.com/zdharma/zplugin
if ! [ -d "$HOME/.zplugin" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

# <<<<<<<<<<<<<<<<<<< start of zplugin installer-added chunk >>>>>>>>>>>>>>>>>>>
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
# <<<<<<<<<<<<<<<<<<< start of zplugin installer-added chunk >>>>>>>>>>>>>>>>>>>

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< start of plugins >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# `zplugin` has a concept called ice modifiers which applies single-use
# modifiers to the next loaded plugin.
#
# the `ice` name communicates that the modifiers last for only the next zplugin
# command
#
# here are the modifiers used in this file:
#
# - wait - load asynchronously
# - atload - command to run when the plugin finishes loading
# - lucid - skip `Loaded ...` message
#
# refs:
# - https://github.com/zdharma/zplugin#ice-modifiers
# - http://zdharma.org/zplugin/wiki/INTRODUCTION/#some_ice-modifiers

zplugin ice wait atload'_zsh_autosuggest_start' lucid
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait atload'zpcompinit; zpcdreplay' lucid
zplugin light zdharma/fast-syntax-highlighting

# synchronize system clipboard
# theoretically you might need to source this after other keymappings, have not
# yet seen a need for enforcing that
zplugin ice wait lucid
zplugin light kutsan/zsh-system-clipboard

# prompt
zplugin light romkatv/powerlevel10k

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end of plugins >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# <<<<<<<<<<<<<<<<<<<<<<<<<<< start of plugin config >>>>>>>>>>>>>>>>>>>>>>>>>>>

# <<<< syntax highlighting >>>>
# TODO: understand why this doesn't seem to be working
# refs:
#   - https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#   - https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md

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

# count only alphanumeric characters as part of a word
WORDCHARS=

# accept until end of line (same as right arrow)
bindkey '^e' autosuggest-accept
# accept until end of line and immediately execute
bindkey '^ ' autosuggest-execute
# accept next word
bindkey '^w' forward-word

# <<< zsh-system-clipboard
# https://github.com/kutsan/zsh-system-clipboard#options
typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX='true'

# <<<<<<<<<<<<<<<<<<<<<<<<<<<< end of plugin config >>>>>>>>>>>>>>>>>>>>>>>>>>>>
