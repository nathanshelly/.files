# .files

My personal dotfiles.

## try them out with zero risk or commitment

Run the following command to play around with these dotfiles in a sandbox:

```bash
docker run --interactive --tty nathanshelly/dotfiles:latest
```

See [`docker/dotfiles`](./docker/dotfiles) for more details.

## getting started

The below commands will run the [`infra/setup/setup_dotfiles`](./infra/setup/setup_dotfiles) setup script.

This script will walk through installing various shell utilities, applications and symlinking various files to their appropriate locations. See [`infra/setup`](./infra/setup/) folder for documentation on the setup process.

```bash
# << start of optional section >>
# run when setting up a new computer and only if you want to use ssh
ssh-keygen -t rsa -b 4096 -f ~/.ssh/github -C "your_email@example.com"
# copy to clipboard on macOS
cat "$HOME/.ssh/github.pub" | pbcopy
# add to GitHub @ https://github.com/settings/keys
# << end of optional section >>

# now clone this repo and run the setup script
cd $HOME # to clone dotfiles to `$HOME/.files`
[ "$(uname)" == "Darwin" ] && xcode-select --install # install `git` for new computer
# remove the `GIT_SSH_COMMAND="..."` unless you ran the above commands
GIT_SSH_COMMAND="ssh -i ~/.ssh/github" git clone git@github.com:nathanshelly/.files.git
cd .files
infra/setup/setup_dotfiles
```

Unless something went wrong (🤞) you're all set up now! 🎉

## overview

Primarily a [`tmux`](https://github.com/tmux/tmux), [`zsh`](https://www.zsh.org) & [`neovim`](https://github.com/neovim/neovim) workflow. See the respective topic folders: [`tmux`](./tmux), [`zsh`](./zsh) & [`neovim`](./neovim).

![workflow](assets/workflow.png 'workflow')

## thanks/credit

Pieces and general organizational structure borrowed from Zach Holman's [@holman does dotfiles](https://github.com/holman/dotfiles).
