# [`tmux`](https://github.com/tmux/tmux)

A terminal multiplexer: enables a number of terminals to be created, accessed, and controlled from a single screen

## [`alias.zsh`](./alias.zsh)

A few useful `tmux` aliases:

- `tl` -> `tmux ls` - list currently running `tmux` sessions
- `tmuxn` -> `tmux -f /dev/null` - start `tmux` without configuration (useful for debugging)

## functions

See [functions README](./functions/README.md).

## [`tmux.conf`](./tmux.conf)

`tmux` configuration.

Here are highlights:

- remap prefix from `C-b` (`Ctrl-b`) -> `M-Space` (`Alt/Option-Space` depending on your OS)
- open new panes/windows to current path (`$PWD`)
- remap pane
  - horizontal: `<prefix> "` -> `M--` (that's `Alt/Option` and `-` at the same time)
  - vertical: `<prefix> %` -> `M-\` (meant to evoke `|` for vertical split but no need to hold `Shift`)
- switch panes w/ `M-(h|j|k|l)`, e.g. `M-h` moves left a pane, `M-j` down a pane, `M-k` up a pane, and `M-l` right a pane
- resize panes w/ `M-(H|J|K|L)`, e.g. `M-H` (`M-Shift-h`) resizes to the left, `M-J` resizes down, etc.
  - Note: by default this resizing is slightly coarse (3x larger increments than the smallest possible). To resize more granularly use `<prefix> M-(h|j|k|l)`.
- switch to last session w/ `<prefix> l` (similar to hitting `Alt-Tab` (Windows) or `Cmd-Tab` (macOS) once)
- enable true color (RGB color), dimming, strikethrough and italics through terminal overrides

This file is symlinked to `$HOME/.tmux.conf` by [`$DOTFILES/infra/setup/bin/symlink`](../infra/setup/bin/symlink).
