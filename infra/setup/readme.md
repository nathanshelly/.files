# setup

## new computer

These commands include steps only run when setting up a new computer and only if you want to use ssh.

```bash
ssh-keygen -f ~/.ssh/github -t ed25519 -C "your_email@example.com"
# copy to clipboard on macOS
cat "$HOME/.ssh/github.pub" | pbcopy

# now add to GitHub @ https://github.com/settings/keys

# to clone dotfiles to `$HOME/.files`
cd $HOME
# install `git` on new macOS machine
[ "$(uname)" = "Darwin" ] && xcode-select --install
# now clone this repo and run setup
GIT_SSH_COMMAND="ssh -i ~/.ssh/github" git clone git@github.com:nathanshelly/.files.git
cd .files
make setup
```

## list of files

- [`bin`](./bin) - executable setup scripts
- [`check_dotfiles_variable.sh`](./check_dotfiles_variable.sh) - verify that `$DOTFILES` environment variable is set, otherwise attempts to set it via user input (quits calling script (when sourced) if cancelled)
- [`setup_dotfiles`](./setup_dotfiles) - top-level setup script which calls each broken out script in [`./bin`](./bin)
