# functions

Git-specific functions autoloaded (lazy loaded) into shell.

## List of functions

- [`gcom`](./gcom) -> `git checkout main` (falls back to `master`)
- [`grm`](./grm) -> `git rebase --interactive main` (falls back to `master`)
- [`grbump`](./grbump) -> rebase given branches onto `main` (falls back to `master`)
- [`cdrr`](./cdrr) - `cd` to repo root if in a git repo
- [`gae`](./gae) - add all files below \$PWD except given files/directories
- [`gback`](./gback) - move back linearly a given number of commits
- [`gcaw`](./gcaw) - add root and ammend w/o verifying or editing commit message
- [`gcawt`](./gcawt) - add tracked files from root and ammend w/o verifying or editing commit message
- [`gcw`](./gcw) - create a commit w/ given message (default `wip`) with all changes starting at root
- [`gcwt`](./gcwt) - create a commit w/ given message (default `wip`) with all changes to tracked files starting at root
- [`gdel`](./gdel) - delete given branch locally & remotely
- [`gfix`](./gfix) & [`gffix`](./gffix) - two part workflow to quickly fix up a mistake in a previous commit
  - [`gfix`](./gfix) - create a `fix` branch at the given hash or the given number of commits back based on argument. If argument is a # < 50 it's treated as a number of commits back, otherwise treated as a hash.
  - [`gffix`](./gffix) - interactively rebase given branch on branch `fix` then delete `fix`
- [`gforw`](./gforw) - move forward linearly a given number of commits towards an optionally given branch (assumes `main` if not given)
- [`gplf`](./gplf) - pull all remotes & hard reset to `origin/<given-branch>`
- [`gplr`](./gplr) - pull all remotes & rebase current branch on `origin/<given-branch>`

## non-executable helpers

Scripts below are purposely non-executable so that they're **not** loaded in interactive shells.

- [`prefer_main.sh`](./prefer_main.sh) - output "main" if "main" branch exists, otherwise "master"
