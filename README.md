# .files

My personal dotfiles configuration for macOS & Linux systems.

No guarantees that it will work with your setup but feel free to open an issue and I'll try to help/improve whatever I can!

## try them out with zero risk or commitment

Run the following command to play around with these dotfiles in a sandbox:

```bash
docker run --interactive --tty nathanshelly/dotfiles:latest
```

See [`docker/dotfiles`](./docker/dotfiles) for more details.

## overview

Primarily a [`tmux`](https://github.com/tmux/tmux), [`zsh`](https://www.zsh.org) & [`neovim`](https://github.com/neovim/neovim) workflow.

See the respective topic folders: [`tmux`](./tmux), [`zsh`](./zsh) & [`neovim`](./neovim).

See [additional documentation](./infra/docs).

![workflow](https://user-images.githubusercontent.com/9750687/74062062-4aff5b00-49a2-11ea-9edd-2dd85c7ea5fb.png 'workflow')

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

## next steps

### add your own configuration

If you have your own shell configuration (a `.bashrc`, `.bash_profile`, `.zshrc`, etc.) you will likely be able to simply source it and get the best of this config while overriding with your own.

> Note: `zsh` is mostly backwards compatible with `bash`. Enough so that most `bash` configs can be sourced from `zsh` without any issues. If you have a more complex `bash` config there may be compatibility issues.

To do so, simply move or copy the file to `$DOTFILES/zsh/local.zsh`. For example, if you want to preserve configuration from a `.bashrc` you'd run the following:

```bash
# or `mv`
cp $HOME/.bashrc $DOTFILES/zsh/local.zsh
source $HOME/.zshrc
```

Your configuration should now be applied on top of these dotfiles. Feel free to open an issue if you have any trouble!

#### secrets

**DO NOT** check in any tokens or credentials like `NPM_TOKEN`s, database URLs, etc. To avoid this, add such secrets to the gitignored `$DOTFILES/zsh/secrets.zsh` (you'll need to create it the first time you want to add a secret).

> Technically `$DOTFILES/zsh/local.zsh` is gitignored as well but splitting out secrets into a separate file can help avoid accidental leakage.

### explore features/configuration

Here's a few items you might be interested in trying/learning more about:

- configure high-level features of these dotfiles (changing the theme, setting your editor, disabling the promopt, etc.) via the [settings](./infra/docs/settings.md)
- configure your prompt appearance via `p10k configure` (or disable the prompt altogether via the `prompt` setting from the previous bullet point)
- use [`fzf` keybindings](./utilities/fzf/README.md#keybindings) to speed up so many things from quickly fuzzily selecting files, find zsh history items you half-remember typing weeks ago, checking out the commit from the one keyword you remember typing in the commit message & more
- use [`fasd`](./utilities/fasd/README.md) to quickly jump to or edit frequently/recently visited directories or files from anywhere
