#! /usr/bin/env zsh

# fuzzy finder
# ref - https://github.com/junegunn/fzf
#
# helpful sources
# refs:
#   - https://github.com/junegunn/fzf/wiki/examples
#   - https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
#   - http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/

# don't run unless `fzf` is installed
command -v fzf > /dev/null || return

"$DOTFILES/infra/scripts/component_enabled.sh" 'fzf' || return 0

# get location of `fzf` config files via `fzf-share` executable
# takes ~4ms as timed by `hyperfine`
FZF_SHARE="$(fzf-share)"

# <<<< completion >>>>
# Note: `$-` lists options set in current shell
# ref - https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables
[[ $- == *i* ]] && [ -f $FZF_SHARE/completion.zsh ] && {
  source "$FZF_SHARE/completion.zsh" 2>/dev/null
}

# set up default key bindings (see config below for more details)
[ -f $FZF_SHARE/key-bindings.zsh ] && {
  source "$FZF_SHARE/key-bindings.zsh"
}

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
# `$FZF_SHARE/key-bindings.zsh`

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

## ctrl-j / ctrl-k (or ctrl-n / ctrl-p) to move cursor up and down
## Enter key to select, ctrl / esc to exit
## in multi-select mode (-m), tab and shift-tab to mark multiple items
## Mouse: scroll, click, double-click; shift-click and shift-scroll on multi-select mode
fzf_opts=(
  --multi
  # do nothing if no results, one result -> select immediately
  --select-1 --exit-0
  --reverse --cycle
  "${_fzf_preview_window}" --height 95%
  --bind ctrl-space:toggle-preview
  --bind ctrl-s:toggle-sort
  --bind ctrl-a:select-all
  --bind ctrl-j:down
  --bind ctrl-k:up
  --bind ctrl-e:preview-down
  --bind ctrl-y:preview-up
  --bind ctrl-d:preview-page-down
  --bind ctrl-u:preview-page-up
)

export FZF_DEFAULT_OPTS="${fzf_opts[*]}"
unset fzf_opts

# <<<< keybindings >>>>

# default keybindings
# `^t` - pastes selected files
# `M-c` - navigate to directory (`cd` into selected folder)
# `^r` - search history (overridden below - still history search but slightly
# different from default behavior)

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
