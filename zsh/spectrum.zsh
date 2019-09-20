#! /usr/bin/env zsh
#
# makes using color codes less painful. Apply a color code with "$FG[...]<text>"
# (or "$BG[...]<text>") where "..." is the corresponding 3 digit color code
# (e.g. 001, 089, 127)
#
# TODO: figure out where $reset_color is set/how that works
# ref - https://github.com/sykora/etc/blob/master/zsh/functions/spectrum

typeset -AHg FX FG BG

FX=(
  reset     "%{[00m%}"
  bold      "%{[01m%}" no-bold      "%{[22m%}"
  italic    "%{[03m%}" no-italic    "%{[23m%}"
  underline "%{[04m%}" no-underline "%{[24m%}"
  blink     "%{[05m%}" no-blink     "%{[25m%}"
  reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
  FG[$color]="%{[38;5;${color}m%}"
  BG[$color]="%{[48;5;${color}m%}"
done
