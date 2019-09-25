# [`fd`](https://github.com/sharkdp/fd) 🔎

A simpler, faster `find` (`fd` is to `find` as `ripgrep` is to `grep`). Skips hidden directories, respects `.gitignore` files, colorized terminal output, smart case (case-insensitive by default, case sensitive if pattern includes a capital).

Here is a heads up comparison on an arbitrary query:

```zsh
find . -iname '*TradeInStep*' -not -path '*/node_modules/*'
# or
fd TradeInStep
```

A few other usage examples:

```zsh
# search for files matching pattern (no more `find . -iname '*PATTERN*'`)
fd pattern

# include hidden and ignored files
fd --hidden --no-ignore pattern
```

## [`alias.zsh`](./alias.zsh)

Alias `fdi` -> `fd --no-ignore` (include files ignored by `.gitignore` or `.ignore` files)
