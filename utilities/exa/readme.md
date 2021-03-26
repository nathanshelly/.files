# [`exa`](https://github.com/ogham/exa) 💎

A prettier ls that comes with friendlier defaults and adds extra contextual information (like git info with --git).

## [`alias.zsh`](./alias.zsh)

Defines a few aliases, using `exa` if installed, `ls` otherwise:

- `l` -> `exa` or `ls -CF` (one less letter 😃)
- `la` -> `exa --all` or `ls -AF` (list hidden files)
- `ll` -> `exa --long --all` or `ls -AFhl` (list all files w/ more detail in column view)
- `li` -> `exa --git-ignore` (no `ls` counterpart so only aliased when `exa` is installed)
