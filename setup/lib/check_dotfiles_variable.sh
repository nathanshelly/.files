#! /usr/bin/env bash

# get path to dotfiles repo root (should be same as $DOTFILES)
#
# Returns:
#   {string} `_COMPUTED_DOTFILES` - path to this repo root
_get_dotfiles_repo_root() {
  local dir

  dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
  cd "$dir" || return
  _COMPUTED_DOTFILES="$(git rev-parse --show-toplevel)"
  cd - >/dev/null 2>&1 || return
}

# checks if DOTFILES environment variable is set, sets it or quits based on user
# input if not
#
# Returns:
#   {string} `DOTFILES` - exports DOTFILES environment variable if user chooses
#     to set it
check_dotfiles_variable() {
  _get_dotfiles_repo_root

  [[ -z "$DOTFILES" ]] && {
    printf "This script requires a DOTFILES environment variable holding the \
path\nto the repo this script is running form. This path appears to be\n\
'%s'.\n\nIs this correct (y/any other key)? " "$_COMPUTED_DOTFILES"
    # `-r` treats backslash as a literal, `-n` accepts one character of input
    read -r -n 1 maybe_continue

    if [[ "$maybe_continue" == 'y' ]]; then
      export DOTFILES="$_COMPUTED_DOTFILES"
      printf "\n\nDOTFILES set to '%s'. Note that this export exists\
\nonly within this script.\n" "$DOTFILES"
    else
      printf "\n\nTo continue, set DOTFILES \
(\`export DOTFILES=<path-to-dotfiles-repo>\`),\nthen rerun this script.\n\
Goodbye.\n"
      exit
    fi
  }
}

check_dotfiles_variable
