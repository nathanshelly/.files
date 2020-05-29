# environment variables that require dependencies to set (currently just `jq`)

# get editor from local settings
export EDITOR="$($DOTFILES/infra/scripts/get_local_setting.sh "editor")"

# LESSOPEN configures preprocessor that colors ANSI escape sequences
# http://www.andre-simon.de/doku/highlight/en/integration.php
export LESSOPEN="| $(command -v highlight) %s --out-format truecolor \
--line-numbers --force --style base16/onedark --no-trailing-nl"

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

set_git_pager_theme
