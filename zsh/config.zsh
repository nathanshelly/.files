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
    "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
    $path
  )
}

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# set default editors
# technically only aliasing $VISUAL is necessary but $EDITOR is used elsewhere
# in these dotfiles and should be `nvim`
export VISUAL=nvim
export EDITOR=nvim

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
