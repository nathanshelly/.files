#! /usr/bin/env bash

command -v jq > /dev/null || exit 1

ENABLED="$("$DOTFILES/infra/scripts/get_local_setting.sh" "$1")"
[[ $ENABLED == true ]]
