#! /usr/bin/env bash

# `-raw-output` strips quotes from strings
# ref - https://github.com/stedolan/jq/issues/1735#issuecomment-427863218
jq --raw-output --arg KEY "$1" '.[$KEY]' < "$DOTFILES/.files-settings.json"
