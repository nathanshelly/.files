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
alias pm="$(package_manager)"
alias t=trash # macOS trash command
