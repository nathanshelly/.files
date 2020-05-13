#! /usr/bin/env zsh

# fuzzy finder
# ref - https://github.com/junegunn/fzf
#
# helpful sources
# refs:
#   - https://github.com/junegunn/fzf/wiki/examples
#   - https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
#   - http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/

# <<<< completion >>>>

# don't run unless `fzf` is installed
command -v fzf > /dev/null || return

"$DOTFILES/infra/scripts/component_enabled.sh" 'fzf' || return 0

# Note: `$-` lists options set in current shell
# ref - https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables
[[ $- == *i* ]] && {
  source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh" 2>/dev/null
}

# default keybindings
# `^t` - pastes selected files
# `M-c` - navigate to directory (`cd` into selected folder)
# `^r` - search history (overridden below - still history search but slightly
# different from default behavior)
source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"

# use `fd` for `**` path & directory completion if installed
command -v fd > /dev/null && {
  # path completion - `$1` is the base path to start traversal
  _fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
  }

  # directory completion - `$1` is the base path to start traversal
  _fzf_compgen_dir() {
    fd --type directory --hidden --follow --exclude ".git" . "$1"
  }
}

# <<<< config >>>>

# NOTE: corresponding widgets defined in `./functions` &
# `$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh`

# << zsh functions -> widgets >>
# zsh requires explicit marking of functions that will be mapped as widgets
zle -N fzf_edit_widget
zle -N fzf_repo_file_widget
zle -N fzf_all_widget
zle -N fzf_history_widget_accept
zle -N fzf_modified_history_widget

# << shared >>
_fzf_bat_preview="--preview='bat --style=numbers --color=always {}'"
_fzf_preview_window="--preview-window=down:75%"
_fzf_hidden_preview_window="${_fzf_preview_window}:hidden"

if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git --type file"
  export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git"
else
  export FZF_DEFAULT_COMMAND="find -L . -type f"
  export FZF_ALT_C_COMMAND="find . -type d"
fi

export FZF_DEFAULT_OPTS="--height 99% --reverse --no-mouse --cycle\
 --select-1 --exit-0 --multi\
 $_fzf_preview_window\
 --bind ctrl-j:down,ctrl-k:up,ctrl-space:toggle-preview,\
ctrl-d:preview-page-down,ctrl-u:preview-page-up,ctrl-a:select-all+accept"

# << list files >>

# filter and output files from the root of the current git repo
bindkey '^g' fzf_repo_file_widget
# filter and output all files/directories (including those listed in (git)ignore
# files) below current directory
bindkey '^a' fzf_all_widget

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$_fzf_bat_preview $_fzf_hidden_preview_window"

# << navigate to directory (`cd` into selected folder) >>
export FZF_ALT_C_OPTS="--preview='exa --color always {}'"

# << edit w/ $EDITOR >>

# edit selected file (same as `e <c-f>`)
bindkey '^p' fzf_edit_widget
export FZF_EDIT_OPTS="$_fzf_bat_preview"

# << shell history >>
# ref - https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
bindkey -M vicmd '/' fzf_modified_history_widget
bindkey '^r' fzf_modified_history_widget
