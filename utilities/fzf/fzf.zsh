# fuzzy finder
# ref - https://github.com/junegunn/fzf
#
# helpful sources
# refs:
#   - https://github.com/junegunn/fzf/wiki/examples
#   - https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
#   - http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/

# <<<< completion >>>>

brew_prefix="$(brew --prefix)"

# Note: `$-` lists options set in current shell
# ref - https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables
[[ $- == *i* ]] && {
  source "$brew_prefix/opt/fzf/shell/completion.zsh" 2>/dev/null
}

# keybindings
source "$brew_prefix/opt/fzf/shell/key-bindings.zsh"

# use `fd` for `**` path completion
# `$1` is the base path to start traversal
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# use `fd` for `**` directory completion
# `$1` is the base path to start traversal
_fzf_compgen_dir() {
  fd --type directory --hidden --follow --exclude ".git" . "$1"
}

# <<<< options >>>>

export FZF_DEFAULT_OPTS="--height 75% --reverse --no-mouse --cycle --ansi\
 --select-1 --exit-0\
 --bind ctrl-k:down,ctrl-l:up,space:toggle-preview,alt-d:preview-page-down,\
alt-u:preview-page-up,ctrl-a:select-all+accept"
_fzf_bat_preview="--preview='bat --style=numbers --color=always {}'"
export FZF_CTRL_T_OPTS="$_fzf_bat_preview --preview-window=hidden"
export FZF_EDIT_OPTS="$_fzf_bat_preview"


# <<<< commands >>>>

export FZF_DEFAULT_COMMAND="fd --type file --hidden --follow --exclude .git"
# NOTE: actually mapped to `C-f`
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# NOTE: actually mapped to `C-t`
export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git"

# <<<< keybindings >>>>
# NOTE: corresponding widgets defined in `$DOTFILES/functions/_fzf_functions` &
# `$(brew --prefix)/opt/fzf/shell/key-bindings.zsh`

# << zsh functions -> widgets >>
zle -N fzf-edit-widget
zle -N fzf-history-widget-accept
zle -N fzf-modified-history-widget

# paste selected files
bindkey '^f' fzf-file-widget

# cd into selected folder
# Note: overrides default of '^t' being bound to `fzf-file-widget`
bindkey '^t' fzf-cd-widget

# edit selected file (same as `e <c-f>`)
bindkey '^p' fzf-edit-widget

# shell history
# ref - https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
bindkey -M vicmd '/' fzf-modified-history-widget
bindkey '^r' fzf-modified-history-widget
