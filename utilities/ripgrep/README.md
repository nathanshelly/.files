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

Turns on smart case by default by aliasing `rg` -> `rg --smart-case`. Adds several additional aliases, a few highlights:

- `rgf` - search literal strings
- `rgnt` - exclude test/spec files from search
- `rgt` - search only test/spec files
- `rgu` - ignore `.gitignore` & `.ignore` files, include hidden files/directories & binary files
- `rgw` - only match whole words
