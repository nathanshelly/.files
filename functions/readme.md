# functions

Functions autoloaded (lazy loaded) into shell.

## List of functions

- [`extract`](./extract) - extracts archived files (e.g. `.gz`, `.tar.bz2`, `.zip`, etc.)
- [`fs`](./fs) - gives human readable size of file or directory
- [`smat`](./smat) - "smart cat", `smat README.md` becomes `mdcat README.md` while `smat not-a-markdown-file.js` becomes `bat not-a-markdown-file.js` (or `cat ...` if `bat` is not installed)

> Note: `smat` falls back to `bat` for multiple files since `mdcat` only supports a single file

- [`spectrum_ls`](./spectrum_ls) - display each 256 color code with the number of the color
