# setup

## new computer

These commands include steps only run when setting up a new computer and only if you want to use ssh.

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@opendoor.com"
# copy to clipboard on macOS
cat "$HOME/.ssh/id_rsa.pub" | pbcopy

# now add to GitHub @ https://github.com/settings/keys

cd $HOME # to clone dotfiles to `$HOME/.odotfiles`
# install `git` on new macOS machine
[ "$(uname)" == "Darwin" ] && xcode-select --install
# now clone this repo and run setup
git clone git@github.com:opendoor-labs/odotfiles.git .odotfiles
cd .odotfiles
make setup
```

## list of files

- [`bin`](./bin) - executable setup scripts
- [`check_dotfiles_variable.sh`](./check_dotfiles_variable.sh) - verify that `$DOTFILES` environment variable is set, otherwise attempts to set it via user input (quits calling script (when sourced) if cancelled)
- [`setup_dotfiles`](./setup_dotfiles) - top-level setup script which calls each broken out script in [`./bin`](./bin)
