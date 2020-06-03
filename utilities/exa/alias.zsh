#! /usr/bin/env zsh

# replacement for `ls`
# ref - https://github.com/ogham/exa
command -v exa > /dev/null && {
  alias l='exa'
  # options - https://github.com/ogham/exa#options
  alias la='l --all'
  alias ll='l --long --all'
} || {
  # exa not installed

  # `-F` display characters indicating properties, e.g. `/` for directory
  alias l='ls -F'
  # `-A` list all entries except `.` & `..`
  alias la='ls -AF'
  # `-l` long format (more details)
  # `-h` human readable units (byte, kilobyte, etc.)
  alias ll='ls -AFhl'
}
