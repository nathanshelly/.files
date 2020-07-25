#! /usr/bin/env zsh

# this file initializes the `asdf` version manager
# initialization is done here so that it can be sourced in `./zshrc`
# after all other `zsh` config files have been sourced to avoid conflicts.
#
# ref - https://asdf-vm.com/#/core-manage-asdf-vm?id=add-to-your-shell
#
# see more details on `asdf` and my global config in `$DOTFILES/utilities/asdf`

"$DOTFILES/infra/scripts/component_enabled.sh" 'asdf' || return 0


if [ -f "$HOME/.asdf/asdf.sh" ]; then
  # git installation (method used by `$DOTFILES/infra/setup/bin/setup_asdf.sh`)
  source "$HOME/.asdf/asdf.sh"
  return 0
fi

source_homebrew_asdf() {
  local path_to_homebrew_asdf="$(brew --prefix)/opt/asdf/asdf.sh"

  [ -f "$path_to_homebrew_asdf" ] || return 1

  source "$path_to_homebrew_asdf"
  return 0
}
source_homebrew_asdf && return 0

echo 'Error initializing `asdf`. Try running `$DOTFILES/infra/setup/bin/setup_asdf.sh`.'
echo 'Or setting `asdf: false` in $DOTFILES/.files-settings'
return 0
