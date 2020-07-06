#! /usr/bin/env zsh

# this file initializes the `asdf` version manager
# initialization is done here so that it can be sourced in `./zshrc`
# after all other `zsh` config files have been sourced to avoid conflicts.
#
# see more details on `asdf` and my global config in `$DOTFILES/utilities/asdf`

"$DOTFILES/infra/scripts/component_enabled.sh" 'asdf' || return 0

HOMEBREW_PREFIX="$(brew --prefix)"
# ref - https://asdf-vm.com/#/core-manage-asdf-vm?id=add-to-your-shell
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  # git installation (method used by `$DOTFILES/infra/setup/bin/setup_asdf.sh`)
  source "$HOME/.asdf/asdf.sh"
elif [ -f "$HOMEBREW_PREFIX/opt/asdf/asdf.sh" ]; then
  source "$HOMEBREW_PREFIX/opt/asdf/asdf.sh"
else
  echo 'Error initializing `asdf`. Try running `$DOTFILES/infra/setup/bin/setup_asdf.sh`.'
  exit 0
fi
unset HOMEBREW_PREFIX
