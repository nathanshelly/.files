#! /usr/bin/env zsh

TERMINAL_THEME="$($DOTFILES/infra/scripts/get_local_setting.sh "theme")"
if [ $TERMINAL_THEME = light ]; then
  BAT_THEME="OneHalfLight";
else
  # default to dark theme
  BAT_THEME="TwoDark";
fi
export BAT_THEME
unset TERMINAL_THEME
