alias srczsh="source $HOME/.zshrc"

# launch w/o sourcing configs
alias zshn='zsh -f'

# repo root
alias rr="git rev-parse --show-toplevel"

# << homebrew >>
alias b='brew'
alias bc='brew cask'
alias bu='b update && b upgrade && bc upgrade && b cleanup && b doctor'

# open another alacritty instance
alias alac="open --new /Applications/Alacritty.app"

# discourage usage of rm (in favor of `t` alias for trash)
alias rm='echo "use trash primarily, /bin/rm when needed"'

# <<<< generics >>>>
alias e="$EDITOR" # text editor
alias i=exiftool # metadata info
alias o=open # macOS open command
# search (TODO: maybe use ternary here?)
if command -v rg > /dev/null 2>&1; then
  alias g=rg
else
  # TODO: make function here to really abstract out difference?
  alias g='grep -R'
fi
# if `fd` not installed alias `fd` to `find` (uses `fd` alias instead of `f` as
# that is already used by `fasd`)
# TODO: make function here to really abstract out difference?
command -v fd > /dev/null 2>&1 || alias fd='find . -iname'
alias pm="$(package_manager)"
alias t=trash # macOS trash command
