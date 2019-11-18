# .files

My personal dotfiles.

## try them out with zero risk or effort

Run the following command to play around with these dotfiles in a zero-risk sandbox:

```bash
docker run --interactive --tty nathanshelly/dotfiles:latest
```

See [`docker/dotfiles`](./docker/dotfiles) for more details.

# overview

Primarily a [`tmux`](https://github.com/tmux/tmux), [`zsh`](https://www.zsh.org) & [`neovim`](https://github.com/neovim/neovim) workflow. See the respective topic folders: [`tmux`](./tmux), [`zsh`](./zsh) & [`neovim`](./neovim).

![workflow](assets/workflow.png 'workflow')

## getting started

Clone this repo (I clone it to `~/.files`) then run the setup script: [`<path-to-repo>/setup/install_dotfiles`](./setup/install_dotfiles). This script will walk through installing various shell utilities, applications and symlinking various files to their appropriate locations. See [`setup/bin`](./setup/bin/) folder for documentation on the setup process.

## thanks/credit

Pieces and general organizational structure borrowed from Zach Holman's [@holman does dotfiles](https://github.com/holman/dotfiles).
