#! /usr/bin/env zsh

command -v smat > /dev/null && alias cat=smat # $DOTFILES/functions/smat

# <<<<<<<<< exa >>>>>>>>>
# exa - replacement for `ls`
# ref - https://github.com/ogham/exa
command -v exa > /dev/null && {
  alias l='exa'

  # options - https://github.com/ogham/exa#options

  alias la='l --all'
  # TODO: get newer version of `exa` that supports this
  # alias ld='l --list-dirs'
  alias li='l --git-ignore'
  alias ll='l --long --all'
} || {
  # exa not installed

  # `-C` force multicolumn view
  # `-F` display characters indicating properties, e.g. `/` for directory
  alias l='ls -CF'
  # `-A` list all entries except `.` & `..`
  alias la='ls -AF'
  # `-l` long format (more details)
  # `-h` human readable units (byte, kilobyte, etc.)
  alias ll='ls -AFhl'
}
# <<<<<<<<< end of exa >>>>>>>>>

# <<<<<<<<< ripgrep >>>>>>>>>
if command -v rg > /dev/null; then
  alias f='/usr/local/bin/rg --smart-case'
else
  alias f='grep -R'
fi

# search for literal strings
alias ff='f --fixed-strings'

# search only tests - any filename/directory matching the given patterns
alias ft="f --glob '*test*' --glob '*spec*'"

# ignore tests - exclude any filename/directory matching the given patterns
alias fnt="f --glob '!*test*' --glob '!*spec*'"

# whole word
alias fw='f --word-regexp'

# `-uuu` (`--unrestricted`) ignores .gitignore files, and searches hidden files
# and directories along with binary files
alias fu='f -uuu'
alias fus='f -uuu --case-sensitive'
# <<<<<<<<< end of ripgrep >>>>>>>>>
