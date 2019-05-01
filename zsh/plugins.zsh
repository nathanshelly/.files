# customizing plugins specified in `$DOTFILES/zsh/plugins.txt`, installed from
# `$DOTFILES/zsh/plugins.sh` using `antibody`

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

# see which option I like better
bindkey -M viins '^a' autosuggest-accept # until end of suggestion
bindkey -M viins '^e' autosuggest-accept # until end of suggestion

bindkey -M viins '^ ' autosuggest-execute
bindkey -M viins '^w' forward-word # next word, how `vim` `w` would advance

# <<<< history-substring-search >>>>
# similar to `jk/`, convenient when query already typed out
# ref - https://github.com/zsh-users/zsh-history-substring-search

# << keymappings >>
bindkey '^u' history-substring-search-up
bindkey '^y' history-substring-search-down

# <<< zsh-system-clipboard
# https://github.com/kutsan/zsh-system-clipboard#options
typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX='true'

# << end of configuration >>

# alias generation of plugins file (installation of new plugins)
local ANTIBUNDLE_IN="$DOTFILES/zsh/plugins.txt"
local ANTIBUNDLE_OUT="$DOTFILES/zsh/plugins.sh"
alias antibundle="antibody bundle < $ANTIBUNDLE_IN > $ANTIBUNDLE_OUT"
# remove created variables to avoid littering global scope
unset ANTIBUNDLE_IN ANTIBUNDLE_OUT
