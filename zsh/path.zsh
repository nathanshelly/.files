# TODO: move some of this into `zshenv.symlink`


# zsh conveniently links path array and PATH env var
# to add to path, write `path=(<new-addition> $path)`
typeset -U path

path=(
  /usr/local/bin
  /usr/local/sbin
  $HOME/.cargo/bin
  $path
)

# source all `path.zsh` files throughout this repo
typeset -U path_files
# `(M)...:#<pattern>` filters an array to strings that match the given pattern
# ref - http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion
# (search "(M)" to find the relevant documentation)
path_files=(${(M)config_files:#*/path.zsh})
for path_file in $path_files
do
  source "$path_file"
done
unset path_files path_file
