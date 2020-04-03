# environment variables that require dependencies to set (currently just `jq`)

# get editor from local settings
export EDITOR="$($DOTFILES/infra/scripts/get_local_setting.sh "editor")"

# LESSOPEN configures preprocessor that colors ANSI escape sequences
# http://www.andre-simon.de/doku/highlight/en/integration.php
export LESSOPEN="| $(command -v highlight) %s --out-format truecolor \
--line-numbers --force --style base16/onedark --no-trailing-nl"
