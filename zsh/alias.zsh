#! /usr/bin/env zsh

alias srczsh="source $HOME/.zshrc"

# launch w/o sourcing configs
alias zshn='zsh -f'

# repo root
command -v git > /dev/null && alias rr="git rev-parse --show-toplevel"

command -v trash > /dev/null && alias t=trash # macOS trash command

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
if command -v rg > /dev/null; then
  alias f='rg --smart-case'
else
  alias f='grep -R'
fi

command -v smat > /dev/null && alias cat=smat # $DOTFILES/functions/smat
