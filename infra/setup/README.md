# setup

> Note: to remove my work-specific config run [`unsetup_work`](./bin/unsetup_work)

- [`bin`](./bin) - executable setup scripts
- [`check_dotfiles_variable.sh`](./check_dotfiles_variable.sh) - verify that \$DOTFILES environment variable is set, otherwise attempts to set it via user input (quits calling script (when sourced) if cancelled)
- [`setup_dotfiles`](./setup_dotfiles) - top-level setup script which calls each broken out script in [`./bin`](./bin)
- [`symlink.md`](./symlink.md) - explainer of the symlinking scheme implemented by [`bin/symlink`](./bin/symlink)
