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
cd $HOME # to clone dotfiles to `$HOME/.files`
# now clone this repo and run setup
git clone https://github.com/nathanshelly/.files.git
cd .files
make setup
```

Unless something went wrong (🤞) you're all set up now! 🎉

## overview

Primarily a [`tmux`](https://github.com/tmux/tmux), [`zsh`](https://www.zsh.org) & [`neovim`](https://github.com/neovim/neovim) workflow. See the respective topic folders: [`tmux`](./tmux), [`zsh`](./zsh) & [`neovim`](./neovim).

![workflow](infra/assets/workflow.png 'workflow')

## thanks/credit

Pieces and general organizational structure borrowed from Zach Holman's [@holman does dotfiles](https://github.com/holman/dotfiles).
