#! /usr/bin/env zsh

# dynamically set pager based on color theme in `$DOTFILES/.files-settings.json`

TERMINAL_THEME="$($DOTFILES/infra/scripts/get_local_setting.sh "theme")"
if [ ${TERMINAL_THEME:-""} = light ]; then
  PAGER_THEME="OneHalfLight";
else
  # default to dark theme
  PAGER_THEME="TwoDark";
  COLOR_OVERRIDES=" --plus-color='#1c3428' --plus-emph-color='#37664e' --minus-color='#390423' --minus-emph-color='#af0d6c'"
fi

TEMP_PAGER="delta --tabs=2 --hunk-style=plain --highlight-removed --theme='$PAGER_THEME'${COLOR_OVERRIDES}"

# overhead is minimal so just run on each shell
git config --global core.pager "$TEMP_PAGER"

unset TEMP_PAGER PAGER_THEME TERMINAL_THEME
