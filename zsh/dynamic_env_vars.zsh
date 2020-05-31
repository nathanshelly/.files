# environment variables that cannot be set in zsenv because:
#
# - requiring a dependency to set (currently just `jq`)
# - they would be overwritten by system files sourced between `zshenv` & `zshrc`

main() {
  set_bat_theme
  set_git_pager_theme

  # get editor from local settings
  export EDITOR="$($DOTFILES/infra/scripts/get_local_setting.sh "editor")"

  # LESSOPEN configures preprocessor that colors ANSI escape sequences
  # http://www.andre-simon.de/doku/highlight/en/integration.php
  export LESSOPEN="| $(command -v highlight) %s --out-format truecolor \
--line-numbers --force --style base16/onedark --no-trailing-nl"
}

# set `bat` theme based on terminal theme in `$DOTFILES/.files-settings.json`
set_bat_theme() {
  local terminal_theme

  terminal_theme="$($DOTFILES/infra/scripts/get_local_setting.sh "theme")"
  if [ ${terminal_theme:-""} = light ]; then
    export BAT_THEME="GitHub";
  else
    # default to dark theme
    export BAT_THEME="TwoDark";
  fi
}

set_git_pager_theme() {
  local color_overrides pager_theme terminal_theme

  # dynamically set pager based on color theme in `$DOTFILES/.files-settings.json`
  terminal_theme="$($DOTFILES/infra/scripts/get_local_setting.sh "theme")"
  if [ ${terminal_theme:-""} = light ]; then
    pager_theme="OneHalfLight";
  else
    # default to dark theme
    pager_theme="TwoDark"
    color_overrides=" --plus-color='#1c3428' --plus-emph-color='#37664e'\
      --minus-color='#390423' --minus-emph-color='#af0d6c'"
  fi

  # https://git-scm.com/docs/git-config#Documentation/git-config.txt-corepager
  export GIT_PAGER="delta --tabs=2 --hunk-style=plain --highlight-removed\
    --theme='$pager_theme'${color_overrides}"
}

main "$@"
