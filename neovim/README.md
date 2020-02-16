# [`neovim` (`nvim`)](https://github.com/neovim/neovim)

A modal text editor forked from [`vim`](https://github.com/vim/vim) focused on extensibility and usability.

## why neovim

Here are a few (non-exhaustive) reasons I use `neovim`. These reasons apply equally well to `vim` (see the [alternatives considered](#alternatives-considered) section for my reasoning for `neovim` over `vim`).

A language for editing along with the related idea of modal editing provide a far nicer experience (in my opinion) for writing and editing code. `neovim` definitely has a steeper learning curve than other editors I've used but with some practice I find it more intuitive and powerful.

`neovim` provides boundless potential for mastery as I am constantly learning about new features and getting better at using it.

`vim` (or at least its predecessor `vi`) is installed on just about every system I will ever encounter . While I may not be able to install `neovim` or use parts or all of my configuration on those systems I'll still feel comfortable editing code on any machine. Granted, editors such as `vscode` can edit files on remote machines but I find using such setups less convenient than running `vim` directly on the machine.

I enjoy living in a terminal (as this repo might make clear) and appreciate the journey of building my own `neovim` configuration.

Here are a few other peoples' reasons for using `vim` (which also apply to `neovim`):

- [Why I use Vim](https://pascalprecht.github.io/posts/why-i-use-vim)
- [Coming Home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
- [Vim Novice Videos](http://derekwyatt.org/vim/tutorials/novice/)
- [Your problem with Vim is that you don't grok vi](https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)

### alternatives considered

#### [`vim`](https://github.com/vim/vim)

Originally because `neovim` supported asynchronous plugins before `vim`. Vim 8 added asynchronous support and narrowed the gap between the two.

At this point I'm sticking with `neovim` primarily because in my experience, `neovim`'s development seems quicker and more responsive to the community's requests.

#### [`vscode`](https://github.com/microsoft/vscode/)

Excluding brief experiments with [Sublime Text](https://www.sublimetext.com/3), [Atom](https://atom.io) & [Jetbrains IDEs](https://www.jetbrains.com), `vscode` was my main editor until switching to `vim`. If I weren't using `neovim` (or `vim`) `vscode` would be my next choice.

I appreciate the community's support, its rapid pace of improvement and features such as the debugger & native plugin support.

The biggest reason I'm currently sticking with `neovim` is `vim`'s primary conceit of modal editing/a language for editing (I know there are plugins for `vscode` to recreate much of this behavior but I'd rather use the native implementation). A few other reasons follow in no particular ordering.

`neovim` allows me to conduct all my editing in a terminal. This is a relatively minor consideration but one that increases my happiness with it.

`neovim` supports some plugins for adding text objects/operators that as far as I'm aware have no `vscode` equivalent.

`neovim` has none of the chrome of `vscode` that I prefer to avoid (I know much, if not all, of that chrome can be hidden with settings but I'd rather my editor simply not have it).

## skimmable list of files

- [`alias.zsh`](#alias.zsh) - define shell-level aliases (e.g. `emp <file>` to trigger `:MarkdownPreview` on opening (only works on `.md` files))
- [`coc.jsonc`](#coc.jsonc-%26-coc.nvim) & [`coc.nvim`](#coc.jsonc-%26-coc.nvim) - configure [`coc.nvim`](https://github.com/neoclide/coc.nvim). `coc.jsonc` is similar to `settings.json` for `VSCode`.
- [`colors.vim`](#colors.vim) - configure colors, (e.g. enable true color, set dark background, set color scheme)
- [`commands.vim`](#commands.vim) - add commands, used exclusively through keymappings (e.g. `<leader>tw` executes `TrimWhitespace` which trims extraneous whitespace from the current file)
- [`filetype_specific.vim`](#filetype_specific.vim) - filetype specific settings (e.g insert literal tabs in Makefiles, disable `colorcolumn` in `*.md`, etc.)
- [`fzf.vim`](#fzf.vim) - configure [`fzf.vim`](https://github.com/junegunn/fzf.vim), a plugin for fuzzy searching files, buffers, lines, etc.
- [`init.vim`](#init.vim) - sources every other `*.vim` file in this folder to set up config. Requires `$DOTFILES` environment variable to be appropriately set (see [`zshenv.symlink`](../zsh/zshenv.symlink)).
- [`keymap.vim`](#keymap.vim) - define keymappings (e.g. \`\` (`<space>`) as leader, `jk` to escape insert mode, remap movement keys to home row (`hjkl` -> `jkl;`)). Note: plugin keymappings defined in `plugin_config.vim`.
- [`options.vim`](#options.vim) - set options (e.g. `autowrite` to save on buffer switch, `noswapfile` to disable generation of swapfiles (`*.swp`), indentation behavior (spaces over tabs), filetype specific settings (insert literal tabs in Makefiles, disable colorcolumn in `*.md`))
- [`plugin_config.vim`](#plugin_config.vim) - configure plugins (agnostic of plugin management method)
- [`plugins.vim`](#plugins.vim) - enable plugins, managed using [`vim-plug`](https://github.com/junegunn/vim-plug).
- [`vim_only.vim`](#vim_only.vim) - configure `vi`|`vim`-specific settings

## each file in more detail

### [`alias.zsh`](./alias.zsh)

Define shell-level aliases.

- `enc <file>` - open file w/o config. Mnemonic - `edit no config`.
- `emp <file>` - open file (must be `*.md`) and immediately trigger `MarkdownPreview` (must have [`MarkdownPreview`](https://github.com/iamcco/markdown-preview.nvim) plugin installed). Mnemonic - `edit MarkdownPreview`.

### [`coc.jsonc`](./coc.jsonc) & [`coc.nvim`](./coc.nvim)

Configure [`Conquer of Completion` (`coc`)](https://github.com/neoclide/coc.nvim).

Conquer of Completion is a multipurpose client for language servers (e.g. intellisense, compilation errors, formatting), linters, formatters (e.g. [`prettier`](https://prettier.io) or [`black`](https://github.com/psf/black)) and various other external shell programs (e.g. [`shellcheck`](https://github.com/koalaman/shellcheck). The [documentation](https://github.com/neoclide/coc.nvim) goes into more detail about its capabilities.

This is by far the most valuable plugin I use. `coc` fills in most of the gaps I experience between `neovim` and more IDE-like editors in terms of completion, linting, etc. (without it there's a decent chance I'd be using `vscode`).

`coc` is a plugin installed using `vim-plug` like all other plugins. Unlike other plugins, however, it has its own extension ecosystem. These extensions provide much of the previously mentioned functionality (much of this behavior can also be recreated with manual configuration but these extensions make things simpler by, for example, eliding configuration specifying which program to run to spin up a language server for a given language). These extensions are often wrappers around `vscode` extensions providing beneficial interoperability between the two editors so that users of both benefit. To learn more about `coc`'s extensions view the [wiki](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions).

### [`colors.vim`](./colors.vim)

Configure colors.

Notable configurations:

- enable true color
- set dark background
- set color scheme
- highlight matching parens
- highlight trailing whitespace

### [`commands.vim`](./commands.vim)

Add commands, used exclusively through keymappings.

- `HiTab`/`NoHiTab` - highlight/unhighlight tabs. Mapped to `<leader>ht`/`<leader>htn`.
- `TrimWhitespace` - strip extraneous whitespace from current file. Mapped to `<leader>tw`.

### [`filetype_specific.vim`](./filetype_specific.vim)

Configure options specific to a given filetype.

- Vim - wrap at 80 characters
- Makefile - insert literal tabs
- Markdown - disable colorcolumn
- Git commit messages
  - wrap at 72 characters (set `colorcolumn` to match)
  - highlight subject lines beyond 50 characters
- Python
  - set `colorcolumn` at 89 characters (write up to line not on it)
  - wrap at 88 characters

### [`fzf.vim`](./fzf.vim)

Configure [`fzf.vim`](https://github.com/junegunn/fzf.vim).

`fzf.vim` is a `neovim` plugin for fuzzy searching files, buffers, lines, etc using [`fzf`](https://github.com/junegunn/fzf) as the backend.

Notable keymappings:

- `<c-p>` - fuzzy open files below current shell directory (same as `fzf`)
- `<c-b>` - fuzzy select from open buffers
- `<c-f>` - fuzzy select lines of files below current shell directory (interactive version of `rg`)
- `<c-l>` - fuzzy select lines of current buffer
- `<c-g>` - fuzzy select from `git status` files
- `<leader>hc` - fuzzy select from command history

### [`init.vim`](./init.vim)

Source every other `*.vim` file in this folder to set up config.

Requires `$DOTFILES` environment variable to be appropriately set (see `$DOTFILES` defining in [`zshenv.symlink`](../zsh/zshenv.symlink)).

This file is relatively symlinked (permanently, not via setup script) to [`$DOTFILES/config.symlink/nvim/init.vim`](../config.symlink/nvim/init.vim). The symlink script [`$DOTFILES/infra/setup/bin/symlink`](../infra/setup/bin/symlink) symlinks [`$DOTFILES/config.symlink/nvim/init.vim`](../config.symlink/nvim/init.vim) to `$HOME/.config/nvim/init.vim` (by proxy symlinking this file, one level of indirection).

### [`keymap.vim`](./keymap.vim)

Define keymappings.

Plugin keymappings defined in `plugins.vim`.

Notable keymappings:

> `c-<character>` means `Ctrl-<character>`

- map leader to `<Space>`
- insert mode
  - `jk` to escape insert mode
- normal mode
  - movement keys to home row - `hjkl` -> `jkl;`
    - additionally remap repeating last `tfTF` motion to `h` since that functionality provided by `;` is now overwritten
  - start/end of line movement
    - `'` moves to end of line (remapped from `$`)
      - original behavior of jumping to marks performed with `x` instead (see below)
    - `"` moves to start of line ignoring leading whitespace (remapped from `^`)
      - original behavior of register selection performed with `s` (see below)
  - `c-w` switches to last buffer (remapped from `c-^`)
  - `s` selects registers (remapped from `"`)
    - `ss` selects system register (more accessible alternative to `s+`)
    - `sz` selects unnamed (black hole) register (more accessible alternative to `s_`)
  - `x` to jump to marks (remapped from `'`)

### [`options.vim`](./options.vim)

Set options.

Notable options:

- `backspace=indent,eol,start`
  - enable deleting characters behind where insertion mode is entered
  - deleting at start of line wraps to previous line
- line number behavior
  - relative numbers when in normal mode (for more easily performing operations)
  - absolute numbers in insert mode (for more easily referencing lines, most useful when pairing)
- enable filetype recognition
- enable syntax highlighting
- `autowrite` - save on buffer switch
- `noswapfile` - disable generation of swapfiles (`*.swp`)
- indentation behavior - prefer 2 spaces over tabs
- search behavior
  - show matches as you type
  - highlight all matches
  - smartcase - insensitive by default, becomes sensitive if capital letter typed

### [`plugins.vim`](./plugins.vim)

Enable plugins.

Managed using [`vim-plug`](https://github.com/junegunn/vim-plug).

Here's the format of this file:

```vim
# install `vim-plug` from master if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  ...
endif

" <<<<<<<< plugins >>>>>>>>

call plug#begin()
# enable plugins (install not yet installed plugins w/ :PlugInstall)

... # listed plugins

call plug#end()
```

### [`plugin_config.vim`](./plugin_config.vim)

Configure enabled plugins.

Agnostic of plugin management method.

#### notable configuration

- `<leader>gd` to display diff at current line
- `<leader>jg` to trigger Goyo (minimal writing mode)
- statusline appearance (using [`lightline`](https://github.com/itchyny/lightline.vim)
- `<leader>mp` to launch `MarkdownPreview`
- disable vim-polyglot's Markdown support to use `vim-markdown` for Markdown files

#### notable plugins

- [`coc.nvim`](https://github.com/neoclide/coc.nvim) - multipurpose client, see more detail in the [`coc.nvim`](#coc.jsonc-%26-coc.nvim) section
- operators
  - [`vim-surround`](https://github.com/tpope/vim-surround) - add/modify/delete surrounding characters (see documentation in [`./plugins.vim`](./plugins.vim) or the [`vim-surround` repo](https://github.com/tpope/vim-surround))
  - [`vim-commentary`](https://github.com/tpope/vim-commentary) - comment lines/motions w/ `gcc`/`<motion>gc`
  - [`ReplaceWithRegister`](https://github.com/vim-scripts/ReplaceWithRegister) - replace motion w/ given register (unnamed register by default) - `<register>gr<motion>`
  - [`vim-sort-motion`](https://github.com/christoomey/vim-sort-motion) - sort lines w/ `gs<motion>` (can also be used within a line, e.g. `gsi(` to sort within parens - `(b, c, a) -> (a, b, c)`)
- text objects
  - [`vim-textobj-line`](https://github.com/kana/vim-textobj-line) - `il`/`al` for lines (`al` includes leading indentation, `il` does not)
  - [`vim-textobj-indent`](http://kana.github.io/config/vim/textobj-indent.html) - `ie`/`ae` for indentation levels (see further documentation in [`./plugins.vim`](./plugins.vim))
  - [`vim-textobj-entire`](https://github.com/kana/vim-textobj-entire) - `ae`/`ie` for entire document
- utilities
  - [`vim-repeat`](https://github.com/tpope/vim-repeat) - live preview of currently open markdown file
  - [`markdown-preview.nvim`](https://github.com/iamcco/markdown-preview.nvim) - live preview of currently open markdown file
  - [`git-p.nvim`](https://github.com/iamcco/git-p.nvim) - show git blame/diff information in gutter and on current line
  - [`fzf.vim`](https://github.com/junegunn/fzf.vim) - fuzzy search files, buffers, lines, etc. Configuration is complex enough to be broken out into its own file - [`fzf.vim`](#fzf.vim)
  - [`limelight.vim`](https://github.com/junegunn/limelight.vim) - prettier/more functional statusline
- colors/syntax/languages
  - [`onedark.vim`](https://github.com/joshdick/onedark.vim) - color scheme
  - [`vim-polyglot`](https://github.com/sheerun/vim-polyglot) - syntax for an array of languages
  - [`vim-markdown`](https://github.com/iamcco/markdown-preview.nvim) - markdown syntax (note: `vim-polyglot's` markdown syntax disabled to use this syntax highlighting instead)
  - [`vim-jsx-typescript`](https://github.com/peitalin/vim-jsx-typescript) - `jsx` highlighting for [`React`](https://reactjs.org)
  - ['vim-styled-components'](https://github.com/styled-components/vim-styled-components) - highlighting inside `css'...'` (acutally \`, not ', but can't escape \` inside \`\`)
    > ```javascript
    > // highlights `...` code
    > css`
    >   ...;
    > `
    > ```

### [`vim_only.vim`](./vim_only.vim)

Configure `vi`|`vim`-specific settings.

The majority of these settings have become the default in `nvim` and so no longer need to be set.
