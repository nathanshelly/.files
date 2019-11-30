# [`tmux`](https://github.com/tmux/tmux)

A terminal multiplexer: enables a number of terminals to be created, accessed, and controlled from a single screen

## [`alias.zsh`](./alias.zsh)

A few useful `tmux` aliases:

- `tl` -> `tmux ls` - list currently running `tmux` sessions
- `tmuxn` -> `tmux -f /dev/null` - start `tmux` without configuration (useful for debugging)

## functions

See [functions README](./functions/README.md).

## [`tmux.conf.symlink`](./tmux.conf.symlink) & [`tmux.conf.local.symlink`](./tmux.conf.local.symlink)

`tmux` configuration.

[`tmux.conf.symlink`](./tmux.conf.symlink) is itself a symlink to `$HOME/submodules/gpakosz-tmux/.tmux.conf` (corresponds to [`gpakosz/.tmux/.tmux.conf`](https://github.com/gpakosz/.tmux/blob/master/.tmux.conf)), `gpakosz`'s [`.tmux`](https://github.com/gpakosz/.tmux/) (similar to [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) but for `tmux`). This supplies a base configuation including a prettier, informative status line, `<prefix> +` to [maximize a pane to a new window](https://pempek.net/articles/2013/04/14/maximizing-tmux-pane-new-window/) and copying to system clipboard support.

[`tmux.conf.local.symlink`](./tmux.conf.local.symlink) defines my local config including configuration/overrides of `gpakosz`'s [`.tmux`](https://github.com/gpakosz/.tmux/) along with my own unrelated configuration of `tmux`. Here are highlights:

- remap prefix from `C-b` (`Ctrl-b`) -> `M-Space` (`Alt/Option-Space` depending on your OS)
- open new panes/windows to current path (`$PWD`)
- remap pane
  - horizontal: `<prefix> "` -> `M--` (that's `Alt/Option` and `-` at the same time)
  - vertical: `<prefix> %` -> `M-\` (meant to evoke `|` for vertical split but no need to hold `Shift`)
- switch panes w/ `M-(j|k|l|;)`, e.g. `M-j` moves left a pane, `M-k` down a pane, `M-l` up a pane, and `M-;` right a pane
- resize panes w/ `M-(J|K|L|:)`, e.g. `M-J` (`M-Shift-j`) resizes to the left, `M-K` resizes down, etc.
  - Note: by default this resizing is slightly coarse (3x larger increments than the smallest possible). To resize more granularly use `<prefix> M-(j|k|l|;)`.
- switch to last session w/ `<prefix> l` (similar to hitting `Alt-Tab` (Windows) or `Cmd-Tab` (macOS) once)
- enable true color (RGB color), dimming, strikethrough and italics through terminal overrides

These two files are symlinked to `$HOME/.tmux.conf` & `$HOME/.tmux.conf.local`, respectively, by [`$DOTFILES/setup/bin/symlink`](../setup/bin/symlink).

## [`tmuxinator_configs`](./tmuxinator_configs)

Configuration files defining [`tmuxinator`](https://github.com/tmuxinator/tmuxinator) sessions.
