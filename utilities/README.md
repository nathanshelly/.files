# utilities

Resources for various utilities

- [`bat`](./bat) - a prettier `cat` with syntax highlighting, line numbers, git highlights and paging
- [`exa`](./exa) - a prettier `ls` with friendlier defaults
- [`git`](./git) - version control of choice
- [`fd`](#fd) - a faster `find` with friendlier defaults
- [`fzf`](./fzf) - easily fuzzily filter any list (files, directories, git branches, etc.)
- [`ripgrep`](./ripgrep) - a faster `grep` with friendlier defaults
- [`z.lua`](https://github.com/skywind3000/z.lua) - quickly `cd` to folders based on frequency and recency of access

Wrote up [an explainer](https://gist.github.com/nathanshelly/4b7020d09d413cab823914b06162145a) that covers most of these plus a few others

## utilities w/o a separate README

### `fd`

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
