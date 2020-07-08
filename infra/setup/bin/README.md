# bin

Various setup scripts

- [`setup_git_config`](./setup_git_config) - fill in [`gitconfig.template`](../../../utilities/git/gitconfig.template) template
- [`setup_asdf`](./setup_asdf) - add [`asdf`](https://github.com/asdf-vm/asdf) [plugins](https://github.com/asdf-vm/asdf-plugins) then run `asdf install` to install global versions of packages
- [`setup_bits_and_pieces`](./setup_bits_and_pieces) - set up various bits and pieces
- [`setup_macos_settings`](./setup_macos_settings) - set macOS configuration (currently unimplemented)
- [`setup_neovim`](./setup_neovim) - set up [`neovim`](https://neovim.io/) text editor
- [`setup_work`](./setup_work) - add work-specific configuration (currently just a work-specific gitconfig (name & email))
- [`symlink`](./symlink) - symlink all necessary config files to their respective locations (e.g. `$DOTFILES/neovim/init.vim` -> "\$HOME/.config/nvim/init.vim")
- [`unsetup_work`](./unsetup_work) - remove work config (delete any locally generated files and revert relevant commits)
- [`setup_zsh`](./setup_zsh) - adds [`zsh`](http://zsh.sourceforge.net/) to `/etc/shells`, sets it to the default shell, and loads `zsh` to install plugins & finish installation
