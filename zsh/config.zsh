# -U ensures path does not contain duplicates
typeset -U path

# zsh conveniently links path array and PATH env var (along with other pairs)
path=(
  $HOME/.cargo/bin
  /Applications/Racket\ v7.0/bin
  /usr/local/bin
  $path
)

# add local gems to path if ruby is installed
command -v ruby > /dev/null 2>&1 && {
  path=(
    "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
    $path
  )
}

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# set default editor
export EDITOR=nvim

# Vi mode
# see keymap.zsh for modifications
# Note: spaceship vi mode also enabled
# in prompt.zsh
bindkey -v

# turn on spaceship prompt vi mode
# if using spaceship prompt
command -v spaceship_vi_mode_enable > /dev/null 2>&1 && {
  spaceship_vi_mode_enable
}

# turn on fasd if installed
command -v fasd > /dev/null 2>&1 && {
  eval "$(fasd --init auto)"
}

# alias `vim` to `nvim` if installed
if command -v nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# fzf configuration
export FZF_DEFAULT_OPTS="--height 50% --reverse --bind ctrl-k:down,ctrl-l:up"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
