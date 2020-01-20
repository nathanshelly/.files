# $PATH modification
# zsh conveniently links path array and PATH env var
# to prepend new entry - `path=(<new-addition> $path)`
# to append new entry - `path+=<new-addition>` (`()` required to add >1 entry)

# make path array unique (a set)
typeset -U path

# python dependency manager
[[ -d "$HOME/.poetry/bin" ]] && path=("$HOME/.poetry/bin" $path)

[[ -d "$HOME/.cargo/bin" ]] && path=("$HOME/.cargo/bin" $path) # rust packages

# `rust-analyzer` language server
# built by $DOTFILES/infra/setup/bin/setup_language_servers
[[ -d "$DOTFILES/target/rust-analyzer/target/release" ]] && {
  path=("$DOTFILES/target/rust-analyzer/target/release" $path)
}

# homebrew
[[ -d "$HOMEBREW_PREFIX" ]] && {
  path=(
    "$HOMEBREW_PREFIX/bin"
    "$HOMEBREW_PREFIX/sbin"
    $path
  )

  # TODO: confirm this is needed
  [[ -d "$HOMEBREW_PREFIX/opt/fzf/bin" ]] && {
    path=("$HOMEBREW_PREFIX/opt/fzf/bin" $path)
  }

  # enable usage of `gmake` as `make` (`gmake` installed via `make` in Brewfile)
  [[ -d "$HOMEBREW_PREFIX/opt/make/libexec/gnubin" ]] && {
    path=("$HOMEBREW_PREFIX/opt/make/libexec/gnubin" $path)
  }

  "$DOTFILES/infra/scripts/is_macos.sh" || {
    # TODO: confirm this is necessary on linux
    # add `brew` to path
    # ref - https://docs.brew.sh/Homebrew-on-Linux#install
    eval "$(/home/dot/.linuxbrew/bin/brew shellenv 2> /dev/null)"
  }
}

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
