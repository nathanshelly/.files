#! /usr/bin/env zsh

alias srczsh="source $HOME/.zshrc"

# launch w/o sourcing configs
alias zshn='zsh -f'

command -v home-manager > /dev/null && {
  alias hm="home-manager"
  alias hme="home-manager edit"
  alias hms="home-manager switch"
}

command -v darwin-rebuild > /dev/null && {
  alias dr="darwin-rebuild"
  alias dre="darwin-rebuild edit"
  alias drs="darwin-rebuild switch"
}

# repo root
command -v git > /dev/null && {
  alias g=git
  alias rr="git rev-parse --show-toplevel"
}

if command -v trash > /dev/null; then
  alias t=trash # macOS trash command
else
  alias t="rm -rf"
fi

# alias `shfmt` to apply default args
# `-i 2` -> indent with 2 spaces
# `-bn`  -> start lines with binary operators
# `-ci`  -> indent switch cases
# `-sr`  -> add space after redirect operators (e.g. `> /...` not `>/...`)
command -v shfmt > /dev/null && alias shfmt='shfmt -i 2 -bn -ci -sr'

# <<<< generics >>>>
# these generic aliases allow changing the underlying command without having to
# change your muscle memory
alias e="$EDITOR" # text editor
command -v exiftool > /dev/null && alias i=exiftool # metadata info
command -v open > /dev/null && alias o=open # macOS open command
command -v rg > /dev/null && alias f='rg --smart-case'
command -v smat > /dev/null && alias cat=smat # $DOTFILES/functions/smat
