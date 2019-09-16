# <<<<<<<<<<<<<<<<<<< start of zplugin installer-added chunk >>>>>>>>>>>>>>>>>>>
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
# <<<<<<<<<<<<<<<<<<< start of zplugin installer-added chunk >>>>>>>>>>>>>>>>>>>

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< start of plugins >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
zplugin ice wait atload'_zsh_autosuggest_start' lucid
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay" lucid
zplugin light zdharma/fast-syntax-highlighting

# synchronize system clipboard
# theoretically you might need to source this after other keymappings, have not
# yet seen a need for enforcing that
# TODO: see if this would benefit from asynchronicity
zplugin ice wait"0" lucid
zplugin light kutsan/zsh-system-clipboard

# prompt
# TODO: load asyncronously here?
# zplugin ice atclone'curl -fsSL https://gist.githubusercontent.com/romkatv/7cbab80dcbc639003066bb68b9ae0bbf/raw/pure10k.zsh -o pure10k.zsh' \
#     atpull'%atclone' run-atpull atload"powerlevel9k_prepare_prompts" \
#     src"pure10k.zsh" wait"0" lucid reset-prompt
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
