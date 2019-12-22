# bin

Various setup scripts

- [`setup_git_config`](./setup_git_config) - fill in [`gitconfig.local.symlink.example`](../../git/gitconfig.local.symlink.example) template
- [`setup_asdf`](./setup_asdf) - add [`asdf`](https://github.com/asdf-vm/asdf) [plugins](https://github.com/asdf-vm/asdf-plugins) then run `asdf install` to install global versions of packages
- [`setup_bits_and_pieces`](./setup_bits_and_pieces) - set up various bits and pieces (e.g. adding `zsh` to `/etc/shells` then setting it as the login shell, updating submodules and more)
- [`setup_brew`](./setup_brew) - install [Homebrew](https://brew.sh) and all formulas/casks specified in [`Brewfile`](../../Brewfile)
- [`setup_language_servers`](./setup_language_servers) - set up language servers (providing completion, formatting, linting, etc.) for various languages
  - used with [`coc.nvim`](https://github.com/neoclide/coc.nvim) client (see [config](../../vim/coc.vim))
- [`setup_macos_settings`](./setup_macos_settings) - set macOS configuration (currently unimplemented)
- [`setup_work`](./setup_work) - add work-specific configuration (currently just a work-specific gitconfig (name & email))
- [`symlink`](./symlink) - symlink files throughout `$DOTFILES` based on the scheme described [here](../symlink.md)
- [`unsetup_brew`](./unsetup_brew) - remove [Homebrew](https://brew.sh) and all install casks/formulae
- [`unsetup_work`](./unsetup_work) - remove work config (delete any locally generated files and revert relevant commits)
