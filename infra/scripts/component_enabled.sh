#! /usr/bin/env bash

ENABLED="$("$DOTFILES/infra/scripts/get_local_setting.sh" "$1")"
[[ $ENABLED == true ]]
