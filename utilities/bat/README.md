# [`bat`](https://github.com/sharkdp/bat) 🦇

A prettier cat with syntax highlighting, line numbers, git highlights and paging.

- [`alias.zsh`](./alias.zsh) - aliases `cat` to `bat` when installed
- [`bat.conf`](./bat.conf) - maps syntaxes (e.g. `nvim` -> `vim`) for syntax highlighting
  - `BAT_CONFIG_PATH` defined in [`zshenv.symlink`](../../zsh/zshenv.symlink) allows `bat` to find this file
- [`theme.zsh`](./theme.zsh) - set `bat` color theme based on terminal theme set in [`$DOTFILES/.files-settings.json`](../../.files-settings.json)
