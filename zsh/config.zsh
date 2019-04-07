# -U ensures path does not contain duplicates
typeset -U path

# zsh conveniently links path array and PATH env var (along with other pairs)
path=(
  $HOME/.cargo/bin
  /Applications/Racket\ v7.0/bin
  /usr/local/bin
  /usr/local/sbin
  $path
)

# add local gems to path if ruby is installed
command -v ruby > /dev/null 2>&1 && {
  path=(
    # `-r` loads specified library (`rubygems`)
    # `-e` specify script to run
    "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
    $path
  )
}

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# turn on fasd if installed
command -v fasd > /dev/null 2>&1 && eval "$(fasd --init auto)"

# fzf configuration
export FZF_DEFAULT_OPTS="--height 50% --reverse --bind ctrl-k:down,ctrl-l:up"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# case insensitive completion
# ref - https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directorys-and
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
