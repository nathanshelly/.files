# bin

Various setup scripts

- [`setup_git_config`](./setup_git_config) - fill in [`gitconfig.local.symlink.example`](../../git/gitconfig.local.symlink.example) template
- [`setup_asdf`](./setup_asdf) - add [`asdf`](https://github.com/asdf-vm/asdf) [plugins](https://github.com/asdf-vm/asdf-plugins) then run `asdf install` to install global versions of packages
- [`setup_bits_and_pieces`](./setup_bits_and_pieces) - set up various bits and pieces
- [`setup_brew`](./setup_brew) - install [Homebrew](https://brew.sh) and all formulas/casks specified in [`Brewfile`](../../Brewfile)
- [`setup_language_servers`](./setup_language_servers) - set up language servers (providing completion, formatting, linting, etc.) for various languages
  - used with [`coc.nvim`](https://github.com/neoclide/coc.nvim) client (see [config](../../vim/coc.vim))
- [`setup_macos_settings`](./setup_macos_settings) - set macOS configuration (currently unimplemented)
- [`setup_neovim`](./setup_neovim) - set up [`neovim`](https://neovim.io/) text editor
- [`setup_submodules`](./setup_submodules) - set up submodules ([`.tmux`](https://github.com/gpakosz/.tmux))
- [`setup_work`](./setup_work) - add work-specific configuration (currently just a work-specific gitconfig (name & email))
- [`symlink`](./symlink) - symlink files throughout `$DOTFILES` based on the scheme described [here](../symlink.md)
- [`unsetup_brew`](./unsetup_brew) - remove [Homebrew](https://brew.sh) and all install casks/formulae
- [`unsetup_work`](./unsetup_work) - remove work config (delete any locally generated files and revert relevant commits)
- [`setup_zsh`](./setup_zsh) - adds [`zsh`](http://zsh.sourceforge.net/) to `/etc/shells`, sets it to the default shell, and loads `zsh` to install plugins & finish installation
