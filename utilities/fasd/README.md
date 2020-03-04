# [`fasd`](https://github.com/clvv/fasd) 💨

Quickly access files and folders from anywhere on your machine based on frequency and recency of access ("frecency").

> This list sorted by frequency is stored in `$HOME/.fasd` if you're curious.

## usage

- `j <directory-fragment>` - quickly jump to frequently/recently visited directories
  > For example, after `cd`ing to this folder at least once you should be able to get back to it from anywhere by typing `j fasd` (assuming there isn't a different directory matching that snippet that you visit more frequently/recently).
- `ez <file-fragment>` - open files w/ `$EDITOR`
  > For examle, after editing this README at least once you should be able to edit it again from anywhere with `ez fasd read`

## files

- [`alias.zsh`](./alias.zsh) - define the `j` & `ez` aliases explained above
- [`initialize.zsh`](./initialize.zsh) - initialize `fasd` on each shell load
