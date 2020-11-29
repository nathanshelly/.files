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
  # put nix profile first on path
  # TODO: update nix-darwin systempath setting to apply in zshrc vs zshenv then
  # remove this
  [[ -d "/etc/profiles/per-user/$USER/bin" ]] && {
    path=("/etc/profiles/per-user/$USER/bin" $path)
  }
}
modify_path
