# asdf is an extendable version manager that supports various languages
#
# Sort of a one version manager to rule them all idea.
#
# To specify versions for a project one creates a `.tool-versions` file at the
# root of the project with the languages/tools and their respective versions.
# For example:
#
# ```
# ruby 2.5.5
# nodejs 10.15.3
# ```
#
# The first time you work in that project run `asdf install` to set up those
# and you're all done.
#
# refs:
# - https://asdf-vm.com
# - https://github.com/asdf-vm/asdf

# use hardcoded path here because `$(brew --prefix asdf)` is horribly slow
# may need to update hardcoded path if homebrew installation location changes
# could also write this as `$(brew --prefix)/opt/asdf` since generic brew prefix
# is much faster than package specific but still takes ~30ms when timed with
# `hyperfine` so taking the tradeoff of speed/fragility
_asdf_initialization="/usr/local/opt/asdf/asdf.sh"
[ -f "$_asdf_initialization" ] && source "$_asdf_initialization"
unset _asdf_initialization
