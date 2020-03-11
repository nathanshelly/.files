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

Your configuration should now be applied on top of these dotfiles. Please open an issue or reach out in [#odotfiles](https://opendoor.slack.com/app_redirect?channel=odotfiles) if you have trouble!

#### secrets

**DO NOT** check in any tokens or credentials like `NPM_TOKEN`s, database URLs, etc. To avoid this, add such secrets to the gitignored `$DOTFILES/zsh/secrets.zsh` (you'll need to create it the first time you want to add a secret).

> Technically `$DOTFILES/zsh/local.zsh` is gitignored as well but splitting out secrets into a separate file can help avoid accidental leakage.

### explore features/configuration

Here's a few items you might be interested in trying/learning more about:

- configure high-level features of these dotfiles (changing the theme, setting your editor, disabling the promopt, etc.) via the [settings](./infra/docs/settings.md)
- configure your prompt appearance via `p10k configure` (or disable the prompt altogether via the `prompt` setting from the previous bullet point)
- use [`fzf` keybindings](./utilities/fzf/README.md#keybindings) to speed up so many things from quickly fuzzily selecting files, find zsh history items you half-remember typing weeks ago, checking out the commit from the one keyword you remember typing in the commit message & more
- use [`fasd`](./utilities/fasd/README.md) to quickly jump to or edit frequently/recently visited directories or files from anywhere
