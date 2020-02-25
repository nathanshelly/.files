# .files

My personal dotfiles configuration for macOS & Linux systems.

No guarantees that it will work with your setup but feel free to open an issue and I'll try to help/improve whatever I can!

## try them out with zero risk or commitment

Run the following command to play around with these dotfiles in a sandbox:

```bash
docker run --interactive --tty nathanshelly/dotfiles:latest
```

See [`docker/dotfiles`](./docker/dotfiles) for more details.

## getting started

> Note: these dotfiles use 24 bit (true) color. For best results use a compatible terminal emulator, here are a few possibilities: [`Alacritty`](https://github.com/alacritty/alacritty), [`kitty`](https://sw.kovidgoyal.net/kitty/), [`iTerm2` (macOS-specific)](https://iterm2.com/).

The below commands will run the [`infra/setup/setup_dotfiles`](./infra/setup/setup_dotfiles) setup script.

This script will walk through installing various shell utilities, symlinking various files to their appropriate locations, etc. See [`infra/setup`](./infra/setup/) folder for documentation on the setup process.

```bash
cd $HOME # to clone dotfiles to `$HOME/.files`
# now clone this repo and run setup
git clone https://github.com/nathanshelly/.files.git
cd .files
make setup
```

Unless something went wrong (🤞) you're all set up now! 🎉

Configure high-level features of these dotfiles via the [settings](./infra/docs/settings.md).

## overview

Primarily a [`tmux`](https://github.com/tmux/tmux), [`zsh`](https://www.zsh.org) & [`neovim`](https://github.com/neovim/neovim) workflow.

See the respective topic folders: [`tmux`](./tmux), [`zsh`](./zsh) & [`neovim`](./neovim).

See [additional documentation](./infra/docs).

![workflow](https://user-images.githubusercontent.com/9750687/74062062-4aff5b00-49a2-11ea-9edd-2dd85c7ea5fb.png 'workflow')
