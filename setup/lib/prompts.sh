#! /usr/bin/env bash

# <<<< purpose >>>>
#
# define colored prompts for helpful messages
#
# to see all possible styles source this file and call the
# `_prompts_display_supported` function
#
# ```shell
# source $DOTFILES/setup/lib/prompts.sh && _prompts_display_supported
# ```
#
# see bottom of this file for `_prompts_display_supported` definition

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
  local exit=${2:$(false)}

  printf "  [\033[0;31mFAIL\033[0m] $1\n"
  [[ $exit == true ]] && exit
}

# repeats the given string `count` times
#
# ref - https://stackoverflow.com/questions/38868665/multiplying-strings-in-bash-script
_print_repeat() {
  local input=$1 count=$2
  repeated="$(printf "%${count}s")"
  printf "${repeated// /$input}"
}

# indents by '  '*count (2*count spaces) given message printed
indent() {
  local formatter=$1
  local msg=$2
  # always writing indented one level (headers occupy left wall)
  # so most commom use case (therefore default) is to create a sublist, indented
  # one level deeper (two levels total)
  local count=${3:-1}
  _print_repeat '  ' $count
  $formatter $msg
}

# solely for displaying supported styles
_prompts_display_supported() {
  header '<< Heading >>'
  user 'user interaction'
  info 'info'
  success 'success'
  warn 'warning'
  indent user 'nested user'
  indent success 'nested success'
  fail 'failure (NOTE: this also sends `exit` if called w/ `true`)'
}
