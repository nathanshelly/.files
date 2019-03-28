alias srczsh='. ~/.zshrc'

# launch w/o sourcing configs
alias zshn='zsh -f'

alias l='ls -CF'
alias la='ls -AF'
alias ll='ls -AFhl'

# repo root
alias rr="git rev-parse --show-toplevel"

# shortened utilities
alias op=open

alias rm='echo "use trash primarily, /bin/rm when needed"'
alias t=trash

# << homebrew >>
alias b='brew'
alias bc='brew cask'
alias bu='b update && b upgrade && bc upgrade && b cleanup && b doctor'

# open another alacritty instance
alias alac="open -n /Applications/Alacritty.app"
