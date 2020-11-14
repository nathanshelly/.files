# this file sets the $PATH environment variable to enable various executables
#
# why set this here and not in `zshenv`? because macOS & certain Linux distros
# run `/etc/profile` after `zshenv` overwriting path modifications
# ref - https://stackoverflow.com/a/34244862
#
# zsh conveniently links `path` array and `PATH` env var
# to prepend new entry - `path=(<new-addition> $path)`
# to append new entry - `path+=<new-addition>` (`()` required to add >1 entry)
modify_path() {
  # poetry (python dependency manager) executables
  [[ -d "$HOME/.poetry/bin" ]] && path=("$HOME/.poetry/bin" $path)

  # `pip install --user` executables
  [[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" $path)

  # cargo executables
  [[ -d "$HOME/.cargo/bin" ]] && path=("$HOME/.cargo/bin" $path) # rust packages


  # put nix profile first on path
  [[ -d "/etc/profiles/per-user/$USER/bin" ]] && {
    path=("/etc/profiles/per-user/$USER/bin" $path)
  }
}
modify_path

# TODO: remove w/ flakes
modify_nix_path() {
  # make frameworks managed via channels (nix-darwin, home-manager) available
  export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
  # make nix-darwin use the config in this repo
  export NIX_PATH=darwin-config=$DOTFILES/nix/darwin.nix${NIX_PATH:+:}$NIX_PATH
}
modify_nix_path
