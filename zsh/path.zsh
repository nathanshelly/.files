# zsh conveniently links path array and PATH env var
# to add to path, write `path=(<new-addition> $path)`
typeset -U path

path=(
  /usr/local/bin
  /usr/local/sbin
  $path
)
