# git

## [`gitconfig.symlink`](./gitconfig.symlink) & [`gitignore.symlink`](./gitignore.symlink)

Defines global [`.gitignore`](https://git-scm.com/docs/gitignore) and [`.gitconfig`](https://git-scm.com/docs/git-config) that are symlinked to `$HOME/.gitconfig` & `.$HOME/.gitignore`, respectively, by [`$DOTFILES/setup/bin/symlink`](../setup/bin/symlink)

A few of the notable configs set here:

- `ff = only` - only perform fast-forward merges (a `git pull` that would result in a merge instead fails).
- aliases
  - `b` - dump branches to terminal, no pager by default
  - `lb` - a base alias built on top of by `l`, `ln`, `lv` & `lvn` for varying levels of verbosity and printed # of commits
- `[advice]` - turn off git advice to reduce verbosity

## [`gitconfig.symlink.template`](./gitconfig.symlink.template)

A template to be filled in locally with the appropriate name and email.

This template is filled in by [`$DOTFILES/setup/bin/setup_git_config`](../setup/bin/setup_git_config)). The setup script calls this function once to set up a local gitconfig (`$HOME/.gitconfig.local`) and optionally a second time to set up a work gitconfig (`$HOME/.gitconfig.work`).

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
