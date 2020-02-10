#! /usr/bin/env bash

command -v jq > /dev/null || exit 0

ENABLED="$("$DOTFILES/infra/scripts/get_local_setting.sh" "$1")"
[[ $ENABLED == true ]]
