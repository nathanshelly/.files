#! /usr/bin/env zsh

alias srczsh="source $HOME/.zshrc"

# launch w/o sourcing configs
alias zshn='zsh -f'

# repo root
command -v git > /dev/null && alias rr="git rev-parse --show-toplevel"

# << homebrew >>
command -v brew > /dev/null && {
  alias b='brew'
  alias bc='brew cask'
  alias bu='b update && b upgrade && bc upgrade && b cleanup && b doctor'
}

$DOTFILES/infra/scripts/is_macos.sh && {
  # open another terminal (Alacritty) instance
  alias term="open --new /Applications/Alacritty.app"
}

# discourage usage of rm if `trash` is installed (suggests `t` alias`)
command -v trash > /dev/null && {
  alias t=trash # macOS trash command
  alias rm='echo "use trash primarily, /bin/rm when needed"'
}

# alias `shfmt` to apply default args
# `-i 2` -> indent with 2 spaces
# `-bn`  -> start lines with binary operators
# `-ci`  -> indent switch cases
# `-sr`  -> add space after redirect operators (e.g. `> /...` not `>/...`)
command -v shfmt > /dev/null && alias shfmt='shfmt -i 2 -bn -ci -sr'

# <<<< generics >>>>
alias e="$EDITOR" # text editor
command -v exiftool > /dev/null && alias i=exiftool # metadata info
command -v open > /dev/null && alias o=open # macOS open command
if command -v rg > /dev/null; then
  alias f='/usr/local/bin/rg --smart-case'
else
  alias f='grep -R'
fi
# if `fd` not installed alias `fd` to `find` (uses `fd` alias instead of `f` as
# that is already used by `ripgrep`)
command -v fd > /dev/null || alias fd='find . -iname'
command -v package_manager > /dev/null && alias pm="$(package_manager)"
