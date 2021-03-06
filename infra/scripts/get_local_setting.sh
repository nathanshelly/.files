#! /usr/bin/env bash

command -v jq > /dev/null || {
  # shellcheck disable=2016
  echo 'install `jq` to configure dotfiles via a `$HOME/.files-settings` json'
  exit 1
}

# `-raw-output` strips quotes from strings
# ref - https://github.com/stedolan/jq/issues/1735#issuecomment-427863218
jq --raw-output --arg KEY "$1" '.[$KEY]' < "$DOTFILES/.files-settings"
