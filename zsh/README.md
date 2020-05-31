# [`zsh`](https://www.zsh.org)

A modern, backwards-compatible replacement for `bash` that offers essentially a superset of `bash`'s features.

## why `zsh`

`zsh` offers useful features such as complex scripting features, smart tab-completion, advanced globbing support and plugin support while preserving backwards compatibility. Additionally, in my anecdotal experience, `zsh` has greater support in the open source community.

### alternatives considered

#### [`bash`](https://linux.die.net/man/1/bash)

My reasons to not use `bash` are the inverse of why I use `zsh` (e.g. lack of advanced globbing, lack of useful scripting features, worse (in my experience) plugin support, etc.).

In a sign of `zsh`'s mainstreamness Apple is switching to `zsh` for its default shell in the next macOS version (as of 10/03/2019). That alone is not necessarily a reason to use it (especially since a factor in Apple's decision here is licensing related as opposed to end user satisfaction) but for anyone unsure about switching to `zsh` it may offer some surety of it's maturity/viability.

#### [`fish`](https://fishshell.com)

`fish` seems nice, especially its sane scripting syntax. For me, however, its improvements over `zsh` don't outweigh its lack of backwards compatibility.

#### [`nu`](https://github.com/nushell/nushell)

`nu` seems fascinating. I may even jump to it at some point in the future but it's not mature enough for me at the moment to want to make it my daily driver.

## skimmable list of files

- [`alias.zsh`](#aliaszsh) - define generic aliases. Aliases specific to a topic (for example aliases for `tmux`) should go in the corresponding topic folder (e.g. [`$DOTFILES/tmux/alias.zsh`](../tmux/alias.zsh)).
- [`asdf.zsh`](#asdfzsh) - initialize [`asdf`](https://asdf-vm.com) (the version manager I use)
- [`completion.zsh`](#completionzsh) - initialize completion
- [`dynamic_env_vars.zsh`](./dynamic_env_vars.zsh) - set environment variables whose value requires dynamism (dependencies)
- [`functions.zsh`](#functionszsh) - autoload all functions (executable files) defined in any directory named `functions` throughout this repo (`$DOTFILES/**/functions`)
- [`keymap.zsh`](#keymapzsh) - enable `vim` mode for [`zsh` line editor (`zle`)](http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html) and define related keymappings
- [`manydots.zsh`](#manydotszsh) - add a `zle` widget to facilitate specifying relative directories multiple levels above the current directory (transforms `...` -> `../..`)
- [`options.zsh`](#optionszsh) - configure options (anything set using `setopt`)
- [`path.zsh`](#pathzsh) - configure `$PATH`
- [`plugins.zsh`](#pluginszsh) - enable and configure plugins. Managed by [`zinit`](https://github.com/zdharma/zinit).
- [`prompt.zsh`](#promptzsh) - configure prompt appearance (currently [`powerlevel10k`](https://github.com/romkatv/powerlevel10k))
- [`secrets.zsh`](#secretszsh) - store secrets such as API tokens. This file is not checked in to version control (ignored in `$DOTFILES/.gitignore`) and sourced only if it exists.
- [`zle-fsh-theme-overlay.ini`](#zle-fsh-theme-overlayini) - an overlay to customize syntax highlighting
- [`zshenv`](#zshenv) - define environment variables, loaded before any other file in this folder (this file defines `$DOTFILES` & `$PATH`)
- [`zshrc`](#zshrc) - source every `*.zsh` throughout this repo (`$DOTFILES/**/*.zsh`) to set up config

## each file in more detail

### [`alias.zsh`](./alias.zsh)

Define generic aliases.

Topic-specific aliases (for example aliases for `tmux`) should go in the corresponding topic folder (e.g. [`$DOTFILES/tmux/alias.zsh`](../tmux/alias.zsh)).

Notable aliases:

- `srczsh` - `source $HOME/.zshrc`, reload `zshrc`
- `zshn` - `zsh -f`, launch shell w/o config
- `rr` - `git rev-parse --show-toplevel`, gives the absolute path to the root of the current repo
- `rm` - disables `rm` to force usage of [`trash`](https://github.com/sindresorhus/trash) (aliased to `t` elsewhere in this file)
- `e` - `$EDITOR`, provides a generic command to edit a file regardless of the backing program
- `f` - `rg` if installed, `grep -R` otherwise. Similar to `e`, provides a generic command regardless of backing program.
- `t` - [`trash`](https://github.com/sindresorhus/trash), a utility to move files/folders to the trash (instead of deleting permanently) on macOS for recoverability

### [`asdf.zsh`](./asdf.zsh)

Initialize the [`asdf`](https://asdf-vm.com) version manager.

### [`completion.zsh`](./completion.zsh)

Initialize completion. Uses a cache with a refresh every 20 hours to speed up shell load.

### [`dynamic_env_vars.zsh`](./dynamic_env_vars.zsh)

Currently only sets `$EDITOR` to `nvim`.

### [`functions.zsh`](./functions.zsh)

Autoload all functions (executable files) defined in any directory named `functions` throughout this repo (`$DOTFILES/**/functions`).

### [`keymap.zsh`](./keymap.zsh)

Turn on `vim` mode for [`zle`](http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html) and define related keymappings.

Add keymappings to support text objects supported by `vim`. Each of the following can be used with `i` or `a` (e.g. `i<character>` or `a<character>`): `'`, `"`, \`, `{`, `(`, `[`, `<`.

Add keymappings to recreate behavior of [`vim-surround`](https://github.com/tpope/vim-surround) (that link provides usage examples).

Additional notable keymappings:

- insert mode
  - `jk` to escape insert mode
- normal mode
  - start/end of line movement
    - `'` moves to end of line (same behavior as `$`)
    - `"` moves to start of line (same behavior as `0`)
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

### [`prompt.zsh`](./prompt.zsh)

Configure prompt appearance.

Currently using [`powerlevel10k`](https://github.com/romkatv/powerlevel10k). `powerlevel10k` is the [fastest prompt](https://github.com/romkatv/powerlevel10k#is-it-really-fast) I've found that provides the contextual information I want (`git` status, insert/normal mode indicator, last command status code, etc.). It accomplishes this through two primary mechanisms: asynchronous loading and a faster, custom-built [`git status`](https://github.com/romkatv/gitstatus). The asynchronous nature allows input nearly instanteously as contextual information loads in the background. The [faster `git status`](https://github.com/romkatv/gitstatus#why-fast) dramatically speeds up output of `git` contextual information.

Appearance:

![prompt](https://user-images.githubusercontent.com/9750687/74062058-49ce2e00-49a2-11ea-96a7-808db84e7844.png 'prompt')

### [`secrets.zsh`](./secrets.zsh)

Store secrets such as API tokens.

This file is not checked in to version control (ignored in `$DOTFILES/.gitignore`) and sourced only if it exists.

### [`zle-fsh-theme-overlay.ini`](./zle-fsh-theme-overlay.ini)

Customize ZLE syntax highlighting.

The default comment highlighting is unreadable on my terminal theme. This overlay fixes that following the advice [here](https://github.com/zdharma/fast-syntax-highlighting/issues/138#issuecomment-502383578).

### [`zshenv`](./zshenv)

Define environment variables, loaded before any other file in this folder.

A few notable environment variables:

- `$DOTFILES` - specifies path to the root of this repo, used throughout `zsh` configuration
- `$HOMEBREW_PREFIX` - should be equivalent to `brew --prefix`. Hardcoded (dynamic between OSes) to the current stable location to avoid overhead of `brew --prefix` (~25 ms)

This file symlinked to `$HOME/.zshenv` by [`$DOTFILES/infra/setup/bin/symlink`](../infra/setup/bin/symlink)

### [`zshrc`](./zshrc)

Source every `*.zsh` in `$DOTFILES` (NOT just `.zsh` files in this folder) and autoload any functions in `functions` folders throughout this repo. Here is the loading order:

1. [`secrets.zsh`](./secrets.zsh) - only if this file exists
1. [`completion.zsh`](./completion.zsh)
1. [`keymap.zsh`](./keymap.zsh)
1. [`manydots.zsh`](./manydots.zsh)
1. [`options.zsh`](./options.zsh)
1. [`path.zsh`](./path.zsh)
1. [`dynamic_env_vars.zsh`](./path.zsh)
1. [`functions.zsh`](./functions.zsh)
1. [`alias.zsh`](./alias.zsh)
1. [`plugins.zsh`](./plugins.zsh)
1. [`prompt.zsh`](./prompt.zsh)
1. all `.zsh` files throughout this repository (`$DOTFILES/**/*.zsh`) excluding those in `$DOTFILES/zsh` (this directory).
1. [`asdf.zsh`](./asdf.zsh)

`zshrc` itself is loaded after `zshenv` based on `zsh`'s [startup file loading order](http://zsh.sourceforge.net/Intro/intro_3.html).

This file symlinked to `$HOME/.zshrc` by [`$DOTFILES/infra/setup/bin/symlink`](../infra/setup/bin/symlink)
