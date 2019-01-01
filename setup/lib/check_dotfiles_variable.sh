#! /usr/bin/env bash

# checks if DOTFILES environment variable is set, sets it or quits based on user
# input if not
#
# Returns:
#   {string} `DOTFILES` - exports DOTFILES environment variable if user chooses
#     to set it
check_dotfiles_variable() {
  [[ -z "$DOTFILES" ]] && {
    printf "Installation requires a set DOTFILES environment variable.\nThis \
variable must hold the path to this repo (e.g. on my\nmachine I clone this \
repo into my home folder so my DOTFILES\nvariable equals \
'/Users/nathan/.files')\n\nWould you like to set this variable now? \
(y/any other key) "
    read -r -n 1 -s maybe_continue

    [[ "$maybe_continue" == 'y' ]] && {
      printf "\n\nenter path: DOTFILES="
      read -r dotfiles_path
      export DOTFILES="$dotfiles_path"
      printf "\nDOTFILES set to '$DOTFILES'. Note that this export exists only \
in this script\nYou'll need to export again (or just close and reopen your \
terminal) to have DOTFILES\nset in your calling shell (and by extension for \
the changes made here to take effect\n"
    } || {
      printf "\n\nTo continue, set DOTFILES \
(\`export DOTFILES=<path-to-this-repo>\`),\nthen rerun this script\nGoodbye.\n"
      exit
    }
  }
}

check_dotfiles_variable
