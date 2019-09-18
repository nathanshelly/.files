#! /usr/bin/env zsh

# manydots - zle tweak for emulating "..."=="../.." etc.
# type triple dots to input `../..', quadruple dots to `../../..', etc..

# ref - https://github.com/knu/zsh-manydots-magic

manydots.self-insert() {
  emulate -L zsh
  local self_insert_function magic_count
  zstyle -s ':manydots' self-insert-function self_insert_function

  if [[ "$KEYS" == .* && "$LBUFFER" != *...* && "$LBUFFER" == *.. ]] && {
    local -a words
    words=("${(@Q)${(z)LBUFFER}}")
    # `...` is a wildcard operator in go
    [[ ${${(@)words[1,-2]}[(I)go]} = 0 ]] &&
    [[ $words[-1] == (|*[/=]|[\<\>=]\().. ]]
  }
  then
    [[ "$LASTWIDGET" == (self-insert) ]] &&
    zstyle -s ':manydots' magic-count magic_count
    zstyle ':manydots' magic-count $((magic_count+1))
    LBUFFER="$LBUFFER/."
    zle "$self_insert_function"
    return
  fi

  # cancel expansion if it does not seem right
  if [[ "$KEYS" != [=/,:\;\|\&\<\>\(\)\[\]{}^~\'\"\`[:space:]]* &&
    "$LASTWIDGET" == (self-insert) && "$LBUFFER" == *../.. ]] && {
    zstyle -s ':manydots' magic-count magic_count
    [[ "$magic_count" -gt 0 ]]
  }
  then
    repeat $magic_count LBUFFER="${LBUFFER%/..}"
    repeat $magic_count LBUFFER="$LBUFFER."
  fi

  zstyle ':manydots' magic-count 0

  zle "$self_insert_function"
}

manydots.on() {
  emulate -L zsh
  local self_insert_function="${$(zle -lL | awk \
    '$1=="zle"&&$2=="-N"&&$3=="self-insert"{print $4;exit}'):-.self-insert}"

  [[ "$self_insert_function" == manydots.self-insert ]] && return 0

  # For url-quote-magic which does not zle -N itself
  zle -la "$self_insert_function" || zle -N "$self_insert_function"

  zstyle ':manydots' self-insert-function "$self_insert_function"

  zle -A manydots.self-insert self-insert

  zstyle ':manydots' magic-count 0

  return 0
}

zle -N manydots.self-insert
zle -N manydots.on

manydots() {
  manydots.on
}

[[ -o kshautoload ]] || manydots "$@"
