command -v bat > /dev/null || return

if command -v smat > /dev/null && command -v mdcat > /dev/null; then
  # $DOTFILES/functions/smat
  alias cat=smat
else
  alias cat=bat
fi
