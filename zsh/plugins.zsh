# customizing plugins specified in `$DOTFILES/zsh/plugins.txt`, installed from
# `$DOTFILES/zsh/plugins.sh` using `antibody`

# <<<< autosuggestions >>>>
# ref - https://github.com/zsh-users/zsh-autosuggestions#configuration

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244' # light grey
ZSH_AUTOSUGGEST_USE_ASYNC=true # can be set to anything

# in the future consider testing `completion` strategy on feature branch
# ref - https://github.com/zsh-users/zsh-autosuggestions/compare/features/completion-suggestions
ZSH_AUTOSUGGEST_STRATEGY=(history)

# << keymappings >>
# ref - https://github.com/zsh-users/zsh-autosuggestions#key-bindings

bindkey -M viins '^a' autosuggest-accept # until end of suggestion
bindkey -M viins '^ ' autosuggest-execute
bindkey -M viins '^w' forward-word # next word, how `vim` `w` would advance

# <<<< history-substring-search >>>>
# similar to `jk/`, convenient when query already typed out
# ref - https://github.com/zsh-users/zsh-history-substring-search

# << keymappings >>
bindkey '^u' history-substring-search-up
bindkey '^y' history-substring-search-down

