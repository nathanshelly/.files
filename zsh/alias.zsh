alias srczsh="source $HOME/.zshrc"

# launch w/o sourcing configs
alias zshn='zsh -f'

# repo root
alias rr="git rev-parse --show-toplevel"

# shortened utilities
alias e="$EDITOR"

alias o=open
alias pm="$(package_manager)"
alias t=trash

# << homebrew >>
alias b='brew'
alias bc='brew cask'
alias bu='b update && b upgrade && bc upgrade && b cleanup && b doctor'

# open another alacritty instance
alias alac="open --new /Applications/Alacritty.app"

# discourage usage of rm (in favor of `t` alias for trash)
alias rm='echo "use trash primarily, /bin/rm when needed"'

alias antibundle='antibody bundle < "$DOTFILES/zsh/plugins.txt" > "$DOTFILES/zsh/plugins.sh"'
