# $PATH modification
# zsh conveniently links path array and PATH env var
# to prepend new entry - `path=(<new-addition> $path)`
# to append new entry - `path+=<new-addition>` (`()` required to add >1 entry)

# make path array unique (a set)
typeset -U path

# homebrew
[[ -d "$HOMEBREW_PREFIX" ]] && path=(
  "$HOMEBREW_PREFIX/bin"
  "$HOMEBREW_PREFIX/sbin"
  $path
)

[[ -d "$GOPATH/bin" ]] && path=("$GOPATH/bin" $path)
