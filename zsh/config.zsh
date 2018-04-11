# -U ensures path does not contain duplicates
typeset -U path
# zsh conveniently links path array and PATH env var (along with other pairs)
path=(/usr/local/bin $HOME/Library/Python/3.6/bin /usr/local/opt/python/libexec/bin $path)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Vi mode
# see keymap.zsh for modifications
# Note: spaceship vi mode also enabled
# in prompt.zsh
bindkey -v

spaceship_vi_mode_enable

# turn on fasd
eval "$(fasd --init auto)"

# fzf configuration
export FZF_DEFAULT_OPTS="--height 50% --reverse --bind ctrl-k:down,ctrl-l:up"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
