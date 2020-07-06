# this file sets the $PATH environment variable to enable various executables
#
# why set this here and not in `zshenv`? because macOS & certain Linux distros
# run `/etc/profile` after `zshenv` overwriting path modifications
# ref - https://stackoverflow.com/a/34244862
#
# zsh conveniently links `path` array and `PATH` env var
# to prepend new entry - `path=(<new-addition> $path)`
# to append new entry - `path+=<new-addition>` (`()` required to add >1 entry)

typeset -U path # make path array unique (a set)

# python dependency manager
[[ -d "$HOME/.poetry/bin" ]] && path=("$HOME/.poetry/bin" $path)

# where `pip install --user` installs executables
[[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" $path)

[[ -d "$HOME/.cargo/bin" ]] && path=("$HOME/.cargo/bin" $path) # rust packages

# << work-specific >>
[ -d "$HOME/work" ] && {
  { # android studio
    local ANDROID_PATH="$HOME/Library/Android"
    [[ -d "$ANDROID_PATH/tools" ]] && path+="$ANDROID_PATH/tools"
    [[ -d "$ANDROID_PATH/platform-tools" ]] && {
      path+="$ANDROID_PATH/platform-tools"
    }
  }

  # Go executables
  [[ -d "$GOPATH/bin" ]] && path=("$GOPATH/bin" $path)
}
# << end work-specific >>
