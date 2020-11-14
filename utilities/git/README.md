# git

See `gitconfig` & `gitignore` declared via Nix in [`$DOTFILES/nix/git.nix`](../../nix/git.nix).

## [`gitconfig.template`](./gitconfig.template)

A template to be filled in locally with the appropriate name and email.

This template is filled in by [`$DOTFILES/infra/setup/bin/setup_git_config`](../infra/setup/bin/setup_git_config)). The setup script calls this function once to set up a local gitconfig (`$HOME/.gitconfig.local`) and optionally a second time to set up a work gitconfig (`$HOME/.gitconfig.work`).

## [`alias.zsh`](./alias.zsh)

Defines various useful `git` aliases. Most of these aliases avoid using pagers when possible.

A few of my most used:

- `gb` -> `git branch`
- `gcm` -> `git commit -m`
- `gco` -> `git checkout`
- `gl` -> `git log`
- `gpl` -> `git pull`
- `gps` -> `git push`
- `gs` -> `git status --short --branch` - default to less verbose status
- `gr` -> `git rebase --interactive`
  - `gra` -> `git rebase --abort`
  - `grc` -> `git rebase --continue`
  - `gu` -> `git reset HEAD~` - undo last commit, retains all changes from the commits unstaged

## functions

See [functions README](./functions/README.md).
