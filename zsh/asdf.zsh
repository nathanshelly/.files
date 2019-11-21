# this file initializes the `asdf` version manager
# initialization is done here so that it can be sourced in `./zshrc.symlink`
# after all other `zsh` config files have been sourced to avoid conflicts.
#
# see more details on `asdf` and my global config in `$DOTFILES/utilities/asdf`

# use hardcoded path here because `$(brew --prefix asdf)` is horribly slow
# may need to update hardcoded path if homebrew installation location changes
# could also write this as `$(brew --prefix)/opt/asdf` since generic brew prefix
# is much faster than package specific but still takes ~30ms when timed with
# `hyperfine` so taking the tradeoff of speed/fragility
#
# ref - https://asdf-vm.com/#/core-manage-asdf-vm?id=add-to-your-shell
asdf_initialization="/usr/local/opt/asdf/asdf.sh"
[ -f "$asdf_initialization" ] && source "$asdf_initialization"
unset asdf_initialization
