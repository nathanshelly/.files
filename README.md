# odotfiles

macOS configuration for Opendoor employees.

## getting started

> Note: these dotfiles use 24 bit (true) color. For best results use a compatible terminal emulator, here are a few possibilities: [`Alacritty`](https://github.com/alacritty/alacritty), [`kitty`](https://sw.kovidgoyal.net/kitty/), [`iTerm2` (macOS-specific)](https://iterm2.com/), [`Hyper`](https://hyper.is/).

The below commands will run the [`infra/setup/setup_dotfiles`](./infra/setup/setup_dotfiles) setup script.

This script will walk through installing various shell utilities, symlinking various files to their appropriate locations, etc. See [`infra/setup`](./infra/setup/) folder for documentation on the setup process.

These dotfiles must be cloned to `$HOME/.odotfiles` or you will need to update the [`$DOTFILES`](https://github.com/opendoor-labs/odotfiles/blob/b3e4b90f3c9f8428834b6c22a4401add1d1b6f49/zsh/zshenv.symlink#L2) environment variable to point to the cloned location.

```bash
cd $HOME # to clone dotfiles to `$HOME/odotfiles`
# install git on new computers (no-ops if already installed)
xcode-select --install
# now clone this repo and run setup
git clone https://github.com/opendoor-labs/odotfiles.git .odotfiles
cd .odotfiles
make setup
```

Unless something went wrong (🤞) you're all set up now! 🎉

Configure high-level features of these dotfiles via the [settings](./infra/docs/settings.md).
