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

" show ruler @ 80
" (write up to line, not on top of it)
set colorcolumn=81

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
