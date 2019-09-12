command -v fuck || return

# turn on fasd if installed
# use a cache to reduce hit on shell performance
# ref - https://github.com/clvv/fasd#install
fasd_cache="$HOME/.fasd_cache"
# TODO: maybe remove redundant `$(command -v fasd)` here?
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  # load only needed components
  # - `posix-alias` - defined aliases, e.g. `j`, `f`, etc.
  # - `zsh-hook` - define _fasd_preexec and add it to zsh preexec array
  fasd --init posix-alias zsh-hook >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
