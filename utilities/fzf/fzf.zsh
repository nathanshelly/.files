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

# <<<< config >>>>

# NOTE: corresponding widgets defined in `$DOTFILES/functions/_fzf_functions` &
# `$(brew --prefix)/opt/fzf/shell/key-bindings.zsh`

# << zsh functions -> widgets >>
# zsh requires explicit marking of functions that will be mapped as widgets
zle -N fzf-edit-widget
zle -N fzf-history-widget-accept
zle -N fzf-modified-history-widget

# << shared >>
_fzf_bat_preview="--preview='bat --style=numbers --color=always {}'"
_fzf_preview_window="--preview-window=down:75%"
_fzf_hidden_preview_window="${_fzf_preview_window}:hidden"

export FZF_DEFAULT_COMMAND="fd --type file --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS="--height 99% --reverse --no-mouse --cycle --ansi\
 --select-1 --exit-0 --multi\
 $_fzf_preview_window\
 --bind ctrl-k:down,ctrl-l:up,space:toggle-preview,ctrl-d:preview-page-down,\
ctrl-u:preview-page-up,ctrl-a:select-all+accept"

# << list files >>
# NOTE: mapped to `C-f` instead of default `C-t`

# Establish ^f to do a file-search in the usual way, that ignores certain files
export FZF_CTRL_T_OPTS="$_fzf_bat_preview $_fzf_hidden_preview_window"
function fzf_std_file_widget {
   FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
   zle fzf-file-widget
 }
zle -N fzf_std_file_widget
bindkey '^f' fzf_std_file_widget

# Establish ^g to do a file search that includes usually-ignored files
function fzf_ignore_file_widget {
   FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND} --no-ignore"
   zle fzf-file-widget
 }
zle -N fzf_ignore_file_widget
bindkey '^g' fzf_ignore_file_widget

# << navigate to directory (`cd` into selected folder) >>
# NOTE: mapped to `C-t` instead of default `M-c`

# note: overrides default of '^t' being bound to `fzf-file-widget`
bindkey '^t' fzf-cd-widget
export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git"
export FZF_ALT_C_OPTS="--preview='exa --color always {}'"

# << edit w/ $EDITOR >>

# edit selected file (same as `e <c-f>`)
bindkey '^p' fzf-edit-widget
export FZF_EDIT_OPTS="$_fzf_bat_preview"

# << shell history >>
# ref - https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
bindkey -M vicmd '/' fzf-modified-history-widget
bindkey '^r' fzf-modified-history-widget
