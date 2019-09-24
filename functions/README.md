# functions

Functions autoloaded (lazy loaded) into shell.

## List of functions

- [`extract`](./extract) - extracts archived files (e.g. `.gz`, `.tar.bz2`, `.zip`, etc.)
- [`fs`](./fs) - gives human readable size of file or directory
- [`is_in_git_repo`](./is_in_git_repo) - self-descriptive, determines if current script is running in a `git` repo
- [`package_manager`](./package_manager) (aliased to `pm`) - platform agnostic package manager
  - Currently translates to `brew` on macOS & `apt` on Ubuntu. Will add to more platforms as needed.
- [`spectrum_ls`](./spectrum_ls) - display each 256 color code with the number of the color
