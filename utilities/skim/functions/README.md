# functions

`fzf`-specific functions autoloaded (lazy loaded) into shell.

## List of functions

- [`fzf_gf`](./fzf_gf) - filter and output files shown by `git status` (untracked, unstaged, staged) to shell
- [`fzf_gh`](./fzf_gh) - filter `git log` commits and output hash to shell
- [`fzf_gr`](./fzf_gr) - filter all (local and remote) git branches and output to shell
- [`fzf_rg_edit`](./fzf_rg_edit) - filter and edit (w/ `$EDITOR`) lines matching `<query>`
- [`fzf_edit_widget`](./fzf_edit_widget) - filter and edit (w/ `$EDITOR`) files
- [`fzf_kill_by_port`](./fzf_kill_by_port) - filter and kill processes running on the given port
- [`fzf_repo_file_widget`](./fzf_repo_file_widget) - filter and output files from the root of the current repo
- [`fzf_ignored_file_widget`](./fzf_ignored_file_widget) - filter and output files below current directory including ignored (by `.gitignore` or `.ignore` files) files
- [`fzf_modified_history_widget`](./fzf_modified_history_widget) - filter and output/run shell history. Modified from default to allow outputting (w/ `Ctrl-e`) instead of immediate execution for the purpose of editing commands before running
