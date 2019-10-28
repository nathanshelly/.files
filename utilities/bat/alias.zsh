# `cat` w/ color
# ref - https://github.com/sharkdp/bat
if command -v bat > /dev/null && command -v mdcat > /dev/null; then
  # $DOTFILES/functions/smat
  alias cat=smat
fi
