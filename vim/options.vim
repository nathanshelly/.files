" <<<<<<<< General Options >>>>>>>>

" disable beeping and screen flash on error
set visualbell
set t_vb=

" prevent swap files
set noswapfile

" shorter timeouts
set timeoutlen=1000 ttimeoutlen=0

" map leader -> space
let mapleader=" "

" syntax coloring
syntax on

" line numbers
set number
set relativenumber

" numbers in all buffers
" ref - https://vi.stackexchange.com/questions/6436/how-to-show-line-numbers-for-all-buffers-windows-tabs/6441
au BufWinEnter * set number
au BufWinEnter * set relativenumber

" absolute number in insert mode, otherwise hybrid
" ref - https://jeffkreeftmeijer.com/vim-number/
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" scrolloff
set scrolloff=10

" normal backspace
" refs:
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

" indentation
" explanation:
" tabstop - # of columns a tab counts for
" softtabstop - # of columns to use when hitting Tab in insert mode (see refs)
" shiftwidth - # of columns text is indented w/ `<<` & `>>`
" expandtab - insert spaces on Tab
" refs:
" http://vim.wikia.com/wiki/Indenting_source_code
" https://tedlogan.com/techblog3.html
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent

" wrap on linebreak (show as much as possible)
" ref - http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set wrap
set linebreak
set display+=lastline

" allow cursor past end of line
" ref - https://groups.google.com/forum/#!topic/vim_use/XYY1qsv82NM
set virtualedit=onemore

" default to line length of 80, show ruler @ 81
" (write up to line, not on top of it)
set colorcolumn=81

" enable filetype detection, plugin and indentation file loading
" ref - https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
filetype plugin indent on

" force sign column always open
" avoids inconsistent buffer widths & jarring transition
set signcolumn=yes

" open full urls w/ `gx`
" Use whole words when opening URLs, avoids cutting off query parameters
" (`?<query parameter>`) and and anchors (`#<anchor>`)
" ref - http://vi.stackexchange.com/q/2801/1631
let g:netrw_gx="<cWORD>"

" have vim highlight `<>`
" ref - http://vim.1045645.n5.nabble.com/Highlighting-matching-angle-brackets-lt-gt-td1188629.html
set matchpairs+=<:>

" << search >>

" show matches as you type
set incsearch
" highlight all matches
set hlsearch
" case sensitive if the search contains
" capitals (ignorecase needs to be set for this)
" whole word -> /\<word\>
" lowercase sensitive -> /word\C (`\C` can be anywhere)
set ignorecase
set smartcase

" <<<< File Specific >>>>

" << git >>

" commit message subject line wrap and color
au FileType gitcommit set tw=72
au FileType gitcommit hi gitCommitSummary ctermfg=blue

" << makefile >>

" insert tabs, not 2 spaces
au FileType make set noexpandtab

" << markdown >>

au FileType markdown set colorcolumn=

" << python >>

au Filetype python set colorcolumn=89
au Filetype python set textwidth=88
