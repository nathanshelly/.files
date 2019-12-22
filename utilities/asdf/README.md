# [`asdf`](https://github.com/asdf-vm/asdf)

`asdf` is an extendable version manager that supports a variety of languages and tools. Sort of a one-version-manager-to-rule-them-all idea.

To specify versions for a project one creates a `.tool-versions` file at the root of the project with the languages/tools and their respective versions.

For example:

```
nodejs 10.15.3
python 3.8.0
```

The first time you work in that project run `asdf install` to set up your environment and you're all done.

## [`tool-versions.symlink`](./tool-versions.symlink)

Symlinked to `$HOME/.tool-versions` by [`$DOTFILES/infra/setup/bin/symlink`](../../infra/setup/bin/symlink).

This file specifies the global versions of tools to use if there is no other `.tool-versions` file between the current directory and `$HOME`.
