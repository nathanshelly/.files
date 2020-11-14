#! /usr/bin/env bash

main() {
  local enabled
  enabled="$("$DOTFILES/infra/scripts/get_local_setting.sh" "$1")"

  [[ $enabled == true ]]
}

main "$@"
