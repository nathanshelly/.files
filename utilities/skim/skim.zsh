# fuzzy finder
# ref - https://github.com/lotabout/skim
#
# `skim` is a rust implementation of `fzf` with a more advanced algorithm for
# matching. Much of the configuration for `fzf` applies to `skim`.
#
# helpful sources
# refs:
#   - https://github.com/junegunn/fzf/wiki/examples
#   - https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
#   - http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/

# <<<< completion >>>>

# NOTE: if this is causing issues, try seeing if `brew --prefix` returns a
# different value. Using static "/usr/local" for speed
brew_prefix="/usr/local"

# Note: `$-` lists options set in current shell
# ref - https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables
[[ $- == *i* ]] && {
  source "$brew_prefix/opt/sk/share/zsh/site-functions/completion.zsh"
}

# default keybindings
# `^t` - pastes selected files
# `M-c` - navigate to directory (`cd` into selected folder)
# `^r` - overridden below (still history search but slightly different from
# default behavior)
source "$brew_prefix/opt/sk/share/zsh/site-functions/key-bindings.zsh"

# default keybindings
# `^t` - pastes selected files
# `M-c` - navigate to directory (`cd` into selected folder)
# `^r` - overridden below (still history search but slightly different from
# default behavior)

# TODO: handle `fd` not being installed

# <<<< config >>>>

# NOTE: corresponding widgets defined in `./functions`

# << zsh functions -> widgets >>
# zsh requires explicit marking of functions that will be mapped as widgets
zle -N skim_edit_widget
zle -N skim_repo_file_widget
zle -N skim_ignored_file_widget
zle -N skim_history_widget_accept
zle -N skim_modified_history_widget

# << shared >>
_skim_bat_preview="--preview='bat --style=numbers --color=always {}'"
_skim_preview_window="--preview-window=down:75%"
_skim_hidden_preview_window="${_skim_preview_window}:hidden"

export SKIM_DEFAULT_COMMAND="fd --hidden --follow --exclude .git"
export SKIM_DEFAULT_OPTIONS="--height 99% --reverse --cycle --multi\
 $_skim_preview_window\
 --bind ctrl-k:down,ctrl-l:up,ctrl-space:toggle-preview,\
ctrl-d:preview-page-down,ctrl-u:preview-page-up,ctrl-a:select-all+accept"

# << list files >>

# `^f` lists files starting from root of current repo
bindkey '^f' skim_repo_file_widget
# `^a` lists all files/directories (including those listed in (git)ignore files)
bindkey '^a' skim_ignored_file_widget

export SKIM_CTRL_T_COMMAND="$SKIM_DEFAULT_COMMAND"
export SKIM_CTRL_T_OPTS="$_skim_bat_preview $_skim_hidden_preview_window"

# << navigate to directory (`cd` into selected folder) >>
export SKIM_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git"
export SKIM_ALT_C_OPTS="--preview='exa --color always {}'"

# # << edit w/ $EDITOR >>

# edit selected file (same as `e <c-f>`)
bindkey '^p' skim_edit_widget
export SKIM_EDIT_OPTS="$_skim_bat_preview"

# << shell history >>
# ref - https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
bindkey -M vicmd '/' skim_modified_history_widget
bindkey '^r' skim_modified_history_widget
