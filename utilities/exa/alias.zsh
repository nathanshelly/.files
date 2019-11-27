#! /usr/bin/env zsh

# replacement for `ls`
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
