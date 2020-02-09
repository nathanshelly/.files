# bin

Various setup scripts

- [`setup_git_config`](./setup_git_config) - fill in [`gitconfig.local.symlink.example`](../../git/gitconfig.local.symlink.example) template
- [`setup_brew`](./setup_brew) - install [Homebrew](https://brew.sh) and formulas specified in [`Brewfile`](../../Brewfile)
- [`symlink`](./symlink) - symlink files throughout `$DOTFILES` that end in `.symlink`
- [`setup_zsh`](./setup_zsh) - adds [`zsh`](http://zsh.sourceforge.net/) to `/etc/shells`, sets it to the default shell, and loads `zsh` to install plugins & finish installation
