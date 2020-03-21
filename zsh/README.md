# [`zsh`](https://www.zsh.org)

A modern, backwards-compatible replacement for `bash` that offers essentially a superset of `bash`'s features.

See [here](https://github.com/nathanshelly/.files/tree/master/zsh#why-zsh) for more information on why these dotfiles use `zsh`.

## skimmable list of files

- [`alias.zsh`](#alias.zsh) - define various aliases. Some aliases specific to a topic (for example aliases for `git`) are in the corresponding topic folder (e.g. [`$DOTFILES/git/alias.zsh`](../git/alias.zsh)).
- [`completion.zsh`](#completion.zsh) - initialize completion
- [`config.zsh`](#config.zsh) - configure miscellaneous behavior that doesn't fit in any other file (e.g. enabling case insensitive completion)
- [`dynamic_env_vars.zsh`](./dynamic_env_vars.zsh) - set environment variables whose value requires dynamism (dependencies)
- [`functions.zsh`](#functions.zsh) - autoload all functions (executable files) defined in any directory named `functions` throughout this repo (`$DOTFILES/**/functions`)
- [`keymap.zsh`](#keymap.zsh) - enable `vim` mode for [`zsh` line editor (`zle`)](http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html) and define related keymappings
- [`manydots.zsh`](#manydots.zsh) - add a `zle` widget to facilitate specifying relative directories multiple levels above the current directory (transforms `...` -> `../..`)
- [`options.zsh`](#options.zsh) - configure options (anything set using `setopt`)
- [`path.zsh`](#path.zsh) - configure `$PATH`
- [`plugins.zsh`](#plugins.zsh) - enable and configure plugins. Managed by [`zinit`](https://github.com/zdharma/zinit).
- [`p10k.zsh.symlink`](#p10k.zsh.symlink) - configure prompt appearance (currently [`powerlevel10k`](https://github.com/romkatv/powerlevel10k))
- [`secrets.zsh`](#secrets.zsh) - store secrets such as API tokens. This file is not checked in to version control (ignored in `$DOTFILES/.gitignore`) and sourced only if it exists.
- [`zshenv.symlink`](#zshenv.symlink) - define environment variables, loaded before any other file in this folder (this file defines `$DOTFILES` & `$PATH`)
- [`zshrc.symlink`](#zshrc.symlink) - source every `*.zsh` throughout this repo (`$DOTFILES/**/*.zsh`) to set up config

## each file in more detail

### [`alias.zsh`](./alias.zsh)

Define generic aliases.

Topic-specific aliases (for example aliases for `git`) are in the corresponding topic folder (e.g. [`$DOTFILES/git/alias.zsh`](../git/alias.zsh)).

Notable aliases:

- `cat` - [`smat`](../functions/smat) - based on installed utilities conditionally renders `.md` files with [`mdcat`](https://github.com/lunaryorn/mdcat) and other files with [`bat`](https://github.com/sharkdp/bat)
- `l` (& `ll`, `la`, etc.) - various aliases of [`exa`](https://github.com/ogham/exa), a modern replacement for `ls`
- `f` - `rg` if installed, `grep -R` otherwise. Provides a generic search command regardless of backing program.

### [`completion.zsh`](./completion.zsh)

Initialize completion. Uses a cache with a refresh every 20 hours to speed up shell load.

### [`config.zsh`](./config.zsh)

Configure miscellaneous behavior that doesn't fit in any other file.

Set history file location and increases the size of the history to 100,000 lines.

### [`dynamic_env_vars.zsh`](./dynamic_env_vars.zsh)

Currently only sets `$EDITOR` to `nvim`.

### [`functions.zsh`](./functions.zsh)

Autoload all functions (executable files) defined in any directory named `functions` throughout this repo (`$DOTFILES/**/functions`).

### [`keymap.zsh`](./keymap.zsh)

Turns on `vim` mode for [`zle`](http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html) and define related keymappings.

Can be disabled/enabled via the `vi-mode` setting in [`$DOTFILES/.files-settings.json`](../.files-settings.json).

Add keymappings to support text objects supported by `vim`. Each of the following can be used with `i` or `a` (e.g. `i<character>` or `a<character>`): `'`, `"`, \`, `{`, `(`, `[`, `<`.

Add keymappings to recreate behavior of [`vim-surround`](https://github.com/tpope/vim-surround) (that link provides usage examples).

Additional notable keymappings:

- insert mode
  - `jk` to escape insert mode
- normal mode
  - `v` to edit the current command in `$EDITOR`. Quitting the opened editor dumps the edited command to the command line for execution.

### [`manydots.zsh`](./manydots.zsh)

Add a `zle` widget to facilitate specifying relative directories multiple levels above the current directory.

Each `.` typed past `..` increases the level. For example, `cd ...` becomes `cd ../..`. Typing `.` again gives you `cd ../../..`.

### [`options.zsh`](./options.zsh)

Configure options (anything set using `setopt`).

See [list of possible options](http://zsh.sourceforge.net/Doc/Release/Options.html).

Notable options:

- `auto_cd` - type a bare path to automatically perform `cd <path>`. For example (`>` is a prompt symbol here), `> ~/.files` will `cd` to `~/.files`, `> ..` will `cd` up a directory and so on.
- `share_history` - history is synced between simultaneous shells on prompt load. For example, if I have two `tmux` panes open, run `ls` in one, then switch to the other, press `Ctrl-c` (to trigger a prompt load), then press `up` the most recent command in my history will be that `ls` I just ran in the other pane.

### [`path.zsh`](./path.zsh)

Enable and configure `$PATH`.

Uses `zsh`'s handy mapping of `$path` array -> `$PATH` string concatened with `;`. Ensures `$path` array contains each entry only once (like a set) with `typeset -u path`

### [`plugins.zsh`](./plugins.zsh)

Enable and configure plugins.

Managed by [`zinit`](https://github.com/zdharma/zinit).

### [`p10k.zsh.symlink`](./p10k.zsh.symlink)

Configure prompt appearance.

Currently using [`powerlevel10k`](https://github.com/romkatv/powerlevel10k). `powerlevel10k` is the [fastest prompt](https://github.com/romkatv/powerlevel10k#is-it-really-fast) I've found that provides the contextual information I want (`git` status, insert/normal mode indicator, last command status code, etc.). It accomplishes this through two primary mechanisms: asynchronous loading and a faster, custom-built [`git status`](https://github.com/romkatv/gitstatus). The asynchronous nature allows input nearly instanteously as contextual information loads in the background. The [faster `git status`](https://github.com/romkatv/gitstatus#why-fast) dramatically speeds up output of `git` contextual information.

Appearance:

![prompt](https://user-images.githubusercontent.com/9750687/74062058-49ce2e00-49a2-11ea-96a7-808db84e7844.png 'prompt')

### [`secrets.zsh`](./secrets.zsh)

Store secrets such as API tokens.

This file is not checked in to version control (ignored in `$DOTFILES/.gitignore`) and sourced only if it exists.

### [`zshenv.symlink`](./zshenv.symlink)

Define environment variables, loaded before any other file in this folder.

A few notable environment variables:

- `$DOTFILES` - specifies path to the root of this repo, used throughout `zsh` configuration
- `$HOMEBREW_PREFIX` - should be equivalent to `brew --prefix`. Hardcoded (dynamic between OSes) to the current stable location to avoid overhead of `brew --prefix` (~25 ms)

This file symlinked to `$HOME/.zshenv` by [`$DOTFILES/infra/setup/bin/symlink`](../infra/setup/bin/symlink)

### [`zshrc.symlink`](./zshrc.symlink)

Source every `*.zsh` in `$DOTFILES` (NOT just `.zsh` files in this folder) and autoload any functions in `functions` folders throughout this repo. Here is the loading order:

1. [`secrets.zsh`](./secrets.zsh) - only if this file exists
1. [`completion.zsh`](./completion.zsh)
1. [`config.zsh`](./config.zsh)
1. [`manydots.zsh`](./manydots.zsh)
1. [`options.zsh`](./options.zsh)
1. [`path.zsh`](./path.zsh)
1. [`dynamic_env_vars.zsh`](./path.zsh)
1. [`functions.zsh`](./functions.zsh)
1. [`alias.zsh`](./alias.zsh)
1. [`plugins.zsh`](./plugins.zsh)
1. [`p10k.zsh.symlink`](./p10k.zsh.symlink)
1. all `.zsh` files throughout this repository (`$DOTFILES/**/*.zsh`) excluding those in `$DOTFILES/zsh` (this directory).

`zshrc.symlink` itself is loaded after `zshenv.symlink` based on `zsh`'s [startup file loading order](http://zsh.sourceforge.net/Intro/intro_3.html).

This file symlinked to `$HOME/.zshrc` by [`$DOTFILES/infra/setup/bin/symlink`](../infra/setup/bin/symlink)
