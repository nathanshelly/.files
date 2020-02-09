#! /usr/bin/env zsh

# this file initializes the `asdf` version manager
# initialization is done here so that it can be sourced in `./zshrc.symlink`
# after all other `zsh` config files have been sourced to avoid conflicts.
#
# see more details on `asdf` and my global config in `$DOTFILES/utilities/asdf`

"$DOTFILES/infra/scripts/component_enabled.sh" 'asdf' || return 0

# ref - https://asdf-vm.com/#/core-manage-asdf-vm?id=add-to-your-shell
asdf_initialization="$HOMEBREW_PREFIX/opt/asdf/asdf.sh"
[ -f "$asdf_initialization" ] && source "$asdf_initialization"
unset asdf_initialization
