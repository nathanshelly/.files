#! /usr/bin/env bash

# define colored prompts for helpful messages


# << escape sequences >>
# refs
# - https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
# - https://en.wikipedia.org/wiki/ANSI_escape_code
# - http://ascii-table.com/ansi-escape-sequences.php

header() {
  printf "\n\r\033[0;1m$1\033[0m\n\n"
}

info() {
  printf "  [ \033[00;36m..\033[0m ] $1\n"
}

# user interaction
user() {
  printf "  [ \033[0;35m??\033[0m ] $1\n"
}

success() {
  printf "  [ \033[00;32mOK\033[0m ] $1\n"
}

warn() {
  printf "  [\033[0;33mWARN\033[0m] $1\n"
}

fail() {
  printf "  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}
