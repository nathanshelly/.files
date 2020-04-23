" <<<< using vim plug  >>>>
" ref - https://github.com/junegunn/vim-plug

" <<<< automatic installation >>>>
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

" TODO: figure out how to specify nested expansion, save in variable?
" if empty(glob("${XDG_DATA_HOME:-${HOME}/.local/share}/nvim/site/autoload/plug.vim"))
if empty(glob("$HOME/.local/share/nvim/site/autoload/plug.vim"))
  !curl --create-dirs -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim"
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" <<<<<<<< plugins >>>>>>>>

call plug#begin()

" << autocompletion >>

" a multipurpose client for language servers (e.g. intellisense, compilation
" errors, formatting), linters, formatters (e.g. prettier or black) and various
" other external shell programs (e.g. shellcheck)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" provide completions from tmux panes
Plug 'wellle/tmux-complete.vim'

" << motions/operators >>

" < both operators and motions >

" a grab bag of useful normal mode keybindings
"
" here are the ones that interest me enough to install this (time will tell if I
" actually use any of them):
"
" - `[f` - open preceding file alphabetically in the current file's directory
" - `]f` - open succeeding file alphabetically in the current file's directory
" - `<count>[<Space>` - add <count> blank lines above cursor
" - `<count>]<Space>` - add <count> blank lines below cursor
" - `<count>[e` - exchange current line with <count> lines above
" - `<count>]e` - exchange current line with <count> lines below
" - `[p` - paste above the cursor maintaining indentation
" - `[p` - paste below the cursor maintaining indentation
" - `[u<motion>` or `[uu` - URL encode, e.g. foo bar => foo%20bar
" - `]u<motion>` or `]uu` - URL decode, e.g. foo bar => foo%20bar
"
" ref - https://github.com/tpope/vim-unimpaired
Plug 'tpope/vim-unimpaired'

" < operators >

" edit surrounding characters
"
" - `ys<motion/text object><character>` - surround with given character. For
"     example, `ysiw'` on `word` will add surrounding `'`s -> `'word'`.
" - `ds<character>` - delete nearest (innermost) surrounding pair of given
"     character. For example, `ds(` on `(word)` will delete surrounding `()`s ->
"     `word`.
" - `cs<character-to-replace><new-character>` - change nearest (innermost)
"     surrounding pair of valid surrounding characters into any other valid
"     surrounding character pairing. For example, `cs"}` on `"word"` changes the
"     `"`s into `{}` -> `{word}`
"
" See further usage examples - https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" comment code - `gc<motion>`
Plug 'tpope/vim-commentary'

" converts between number representations - decimal <> hex <> octal <> binary
" - `gA` shows all representations of the number under the cursor
" - `crd`, `crx`, `cro` & `crb` convert the number under the cursor to decimal,
"    hex, octal & binary, respectively
" note: `vim-magnum` is a dependency of `vim-radical`
Plug 'glts/vim-magnum' | Plug 'glts/vim-radical'

" replace - `<register>gr<motion>`, replaces motion text with contents of given
" register (unnamed register (`_`) if none given)
Plug 'vim-scripts/ReplaceWithRegister'

" sort w/ `gs<motion>`
" e.g. `gs2k` sorts down two lines (current + 2 below)
Plug 'christoomey/vim-sort-motion'

" < text objects >
" note: curently no motion plugins installed

" this plugin is a dependency for other `kana/vim-textobj-*`
"
" see issue explaining for vim-textobj-line
" - https://github.com/kana/vim-textobj-line/issues/5
"
" dependent plugins:
" - kana/vim-textobj-line
" - kana/vim-textobj-indent
Plug 'kana/vim-textobj-user'

" line (inner `il` & around `al`)
"
" adds two text objects:
" - `<operator>il` - delete line from level of indentation
" - `<operator>al` - delete full line (including whitespace, `dal` <> `dd`)
"
" usage:
" ```
" // `dal` & `dil` do the same on the below line
" text here
"   // on example 'some indented text here' line below
"   // `dal` deletes whole line including whitespace (same effect as `cc`)
"   // `dil` preserves the white space and deletes everything else
"   some indented text here
" more text here
" ```
Plug 'kana/vim-textobj-line'

" indents
"
" `<operator>ii` - operates on all lines at same indentation above and below
"   cursor line. Selection stops at empty lines or lines with different
"   indentation.
" `<operator>ai` - operates on all lines at same or greater indentation above
"   and below cursor line. Selection stops at lines with lesser indentation, NOT
"   at empty lines or lines with greater indentation.
"
" See more details and helpful detailed diagrams of the effect of different
" selections w/ code examples:
" ref - http://kana.github.io/config/vim/textobj-indent.html
Plug 'kana/vim-textobj-indent'

" entire document - `<operator>ae`
" `ae` - entire contents of buffer (slightly shorter version of `ggdG`)
" `ie` - contents of buffer minus leading/trailing whitespace
Plug 'kana/vim-textobj-entire'

" << utilities >>

" git wrapper
Plug 'tpope/vim-fugitive'

" file explorer
Plug 'preservim/nerdtree'

" repeats plugin actions (vim-commentary,  vim-surround, etc.)
Plug 'tpope/vim-repeat'

" Neovim markdown previewer (opens preview in browser)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" git information (blame, diff) in Vim
" note: `sran.vim` is a dependency of `git-p.nvim`
Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
Plug 'iamcco/git-p.nvim'

" show git commit for line under cursor (`<leader>gm`)
Plug 'rhysd/git-messenger.vim'

" fuzzy finder
" configuration is in ./fzf.vim instead of ./plugin_config.vim due to complexity
Plug '/usr/local/opt/fzf'
" Use Sasha's fork which enables previewing of full files based on community's
" fix - https://github.com/junegunn/fzf.vim/issues/751
" NOTE: unless you care about the issue i the above github link I recommend you
" use the canonical 'junegunn/fzf.vim` repo: `Plug 'junegunn/fzf.vim'`
" TODO: check that this fork stays up to date with upstream
Plug 'sashaweiss/fzf.vim', { 'branch': 'preview_fix' }

" distraction free writing
Plug 'junegunn/goyo.vim'

" highlight currently editing text
Plug 'junegunn/limelight.vim'

" open current line in github
" note: opens most recent blob so only works if you are downstream of remote
Plug 'ruanyl/vim-gh-line'

" status line
Plug 'itchyny/lightline.vim'

" universal REPL
Plug 'metakirby5/codi.vim'

" << colors/syntax/languages >>

" jsonc filetype - JSON w/ comments
Plug 'neoclide/jsonc.vim'

" color scheme
Plug 'joshdick/onedark.vim'

" language pack
Plug 'sheerun/vim-polyglot'

" individual languages/syntax
Plug 'tpope/vim-markdown'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" insert color from color picker
Plug 'KabbAmine/vCoolor.vim'

" highlight color codes with their color
" run `:ColorHighlight` to see #FF00AA with a hot pink background
Plug 'chrisbra/Colorizer'

call plug#end()
