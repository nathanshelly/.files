" <<<<<<<< General Options >>>>>>>>

" specify viminfo path
set viminfo+=n~/.viminfo

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

" scrolloff
set scrolloff=10

" normal backspace
set backspace=indent,eol,start

" indentation
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent

" wrap on linebreak (show as much as possible)
set wrap
set linebreak
set display+=lastline

" show rulers @ 80, 100, 120
" (write up to line, not on top of it)
set colorcolumn=81,101,121

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
