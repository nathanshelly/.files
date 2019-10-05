command -v fasd > /dev/null 2>&1 || return

# turn on fasd if installed
# use a cache to reduce hit on shell performance
# ref - https://github.com/clvv/fasd#install
fasd_cache="$HOME/.fasd_cache"
# TODO: maybe remove redundant `$(command -v fasd)` here?
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  # load only needed component
  # - `zsh-hook` - define _fasd_preexec and add it to zsh preexec array
  fasd --init zsh-hook >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
