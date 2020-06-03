# [`ripgrep`](https://github.com/BurntSushi/ripgrep) 🔎

A faster and generally more user friendly replacement for `grep`. It searches recursively by default, respects `.gitignore` (and `.ignore`) files, and skips hidden and binary files.

[Here's](https://blog.burntsushi.net/ripgrep/) a writeup of more details on the tool by it's creator including detailed benchmarks.

Here is a heads up comparison on an arbitrary query:

```zsh
# takes ~30 seconds w/o `--exlude-dir` (this exclude also wouldn't cover all
# files ignored by ripgrep, e.g. go build files, python virtualenvironments, etc.)
grep -r TradeInStep . --exclude-dir=node_modules --color -n

rg TradeInStep
```

Here are some usage examples:

```zsh
# recursively search current directory for pattern
rg pattern

# include .gitignored and hidden files
rg -uu pattern

# search for whole word matches in files matching the given glob
rg -w @types/lodash -g 'package.json'
```

## [`alias.zsh`](./alias.zsh)

`f` is aliased to `rg --smart-case` in `$DOTFILES/zsh/alias.zsh`. Generic alias so that if the underlying utility changes muscle memory is preserved. This also turns on smart case by default.

Adds several additional aliases, a few highlights:

- `ff` - search literal strings
- `fnt` - exclude test/spec files from search
- `ft` - search only test/spec files
- `fu` - ignore `.gitignore` & `.ignore` files, include hidden files/directories & binary files
- `fw` - only match whole words
