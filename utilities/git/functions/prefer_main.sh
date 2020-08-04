#! /usr/bin/env bash

"$DOTFILES/infra/scripts/is_in_git_repo.sh" || {
  echo 'not in a git repo, nothing to show'
  return 0
}

function prefer_main() {
  # default to `main` branch
  if git show-ref --verify --quiet refs/heads/main; then
    echo main
  else
    echo master
  fi
}

prefer_main
