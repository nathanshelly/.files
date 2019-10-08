# [`skim`](https://github.com/lotabout/skim) 🌸 + 🦀

`skim` enables interactive fuzzy filtering of a list of strings (file paths, lines of code, git commits, etc.) with previews

`skim` is a reimplementation of [`fzf`](https://github.com/junegunn/fzf) in Rust.

See longer explainer on `fzf` (which applies equally well to `fzf`) [here](https://gist.github.com/nathanshelly/4b7020d09d413cab823914b06162145a#-fzf).

## [`alias.zsh`](./alias.zsh)

Creates two aliases:

- `rgz <query>` - filter and open lines matching `<query>`
- `killp <port>` - filter and kill processes running on the given port

## [`skim.zsh`](./skim.zsh)

Enables completions/keybindings along with configuring commands/options.

### Configuration

Use `fd` (instead of default `find`) for `**` path & directory completion and keybindings.

Enable multi-select (w/ `Tab` & `Shift-Tab`) by default. Use `Ctrl-a` to select all filtered values. Use `Ctrl-k` & `Ctrl-l` to move down and up results list.

Add previews w/ `bat` (toggleable w/ `Ctrl-Space`). Use `Ctrl-d` & `Ctrl-u` to scroll previews down and up, respectively.

### Keybindings

> `C` here means `Ctrl`

- `C-f` - filter and output files from the root of the current repo
- `C-a` - filter and output files below current directory including ignored (by `.gitignore` or `.ignore` files) files
- `C-p` - filter and edit (w/ `$EDITOR`) files
- `C-r` (or `/` in `vicmd` mode) - filter and run shell history. While filtering hit `C-e` to output the command to the line for editing before running.

## [`git.zsh`](./git.zsh)

> `M` here means `Alt` (on Windows) or `Option` (on macOS)

- `M-f` - filter and output files shown by `git status` (untracked, unstaged, staged) to shell
- `M-h` - filter `git log` commits and output hash to shell
- `M-r` - filter all (local and remote) git branches and output to shell

## [`path.zsh`](./path.zsh)

Add `sk` to `$path`.
