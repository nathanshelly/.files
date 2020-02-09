# git

## [`gitconfig.symlink`](./gitconfig.symlink)

Defines global [`.gitconfig`](https://git-scm.com/docs/git-config) that are symlinked to `$HOME/.gitconfig`, respectively, by [`$DOTFILES/infra/setup/bin/symlink`](../infra/setup/bin/symlink)

## [`gitconfig.template`](./gitconfig.template)

A template to be filled in locally with the appropriate name and email.

This template is filled in by [`$DOTFILES/infra/setup/bin/setup_git_config`](../infra/setup/bin/setup_git_config)). The setup script calls this function to set up a local gitconfig (`$HOME/.gitconfig.local`).

## [`alias.zsh`](./alias.zsh)

Defines various useful `git` aliases. Most of these aliases avoid using pagers when possible. Additionally, many of them depend on aliases defined in [`./gitconfig.symlink`](./gitconfig.symlink) to avoid redundant configuration.

A few of my most used:

- `gb` -> `git branch`
- `gcm` -> `git commit -m`
- `gco` -> `git checkout`
  - `gcom` -> `git checkout master`
- `gl` -> `git log`
- `gpl` -> `git pull`
- `gps` -> `git push`
- `gs` -> `git status --short --branch` - default to less verbose status
- `gr` -> `git rebase --interactive`
  - `gra` -> `git rebase --abort`
  - `grc` -> `git rebase --continue`
  - `grm` -> `git rebase --interactive master`
  - `gu` -> `git reset HEAD~` - undo last commit, retains all changes from the commits unstaged

## functions

See [functions README](./functions/README.md).
