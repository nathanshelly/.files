# -U ensures path does not contain duplicates
typeset -U path
# zsh conveniently links path array and PATH env var (along with other pairs)
path=(/usr/local/bin /Users/nathan/Library/Python/3.6/bin /usr/local/opt/python/libexec/bin $path)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Vi mode
bindkey -v

# prompt
export PS1="%d >> "
