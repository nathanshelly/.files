# environment variables that require dependencies to set (currently just `jq`)

# get editor from local settings
export EDITOR="$($DOTFILES/infra/scripts/get_local_setting.sh "editor")"
