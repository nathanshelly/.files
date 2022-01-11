" prevent swap files
set noswapfile

" save on buffer switch
set autowriteall

" resolves `coc.nvim` issue - https://github.com/neoclide/coc.nvim/issues/649
set nobackup nowritebackup

" shorter timeouts
" updatetime - length of time from last key press to fire `CursorHold` &
" `CursorHoldI` autocmd events
set timeoutlen=1000 ttimeoutlen=0 updatetime=300

" be less verbose (especially redundant due to status line)
set noshowmode

" allow switching away from a dirty buffer (buffer w/ unsaved changes)
set hidden

" syntax coloring
syntax on

" << line numbers >>

" `autocmd`s below cover all use cases for bare `set number|relativenumber`

" numbers in all buffers (including help pages)
" ref - https://vi.stackexchange.com/questions/6436/how-to-show-line-numbers-for-all-buffers-windows-tabs/6441
augroup absolute_number_in_help_pages
  autocmd!
  autocmd BufWinEnter * set number
augroup end

" absolute number in insert mode, otherwise hybrid
" ref - https://jeffkreeftmeijer.com/vim-number/
augroup numbertoggle
  autocmd!
  autocmd InsertLeave,BufEnter,FocusGained * set relativenumber
  autocmd InsertEnter,BufLeave,FocusLost   * set norelativenumber
augroup END

" << end line numbers >>

" scrolloff
set scrolloff=10

" enable mouse
set mouse=a

" manually create folds
" ref - https://unix.stackexchange.com/a/336537
set foldmethod=manual

" indentation
" tabstop - # of columns a tab counts for
" softtabstop - # of columns to use when hitting Tab in insert mode (see refs)
" shiftwidth - # of columns text is indented w/ `<<` & `>>`
" expandtab - insert spaces on Tab
" refs:
" - http://vim.wikia.com/wiki/Indenting_source_code
" - https://tedlogan.com/techblog3.html
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" `<` & `>` will match the indentation of the file
" https://vimtricks.com/p/ensuring-aligned-indentation/
set shiftround

" wrap on linebreak (show as much as possible)
" ref - http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set linebreak

" allow cursor past end of line
" ref - https://groups.google.com/forum/#!topic/vim_use/XYY1qsv82NM
set virtualedit=onemore

" default to line length of 80, show ruler @ 81
" (write up to line, not on top of it)
set colorcolumn=81

augroup work_specific
  autocmd!
  " line length of 80, show ruler @ 81
  autocmd BufNewFile,BufRead $HOME/work/* set colorcolumn=101
augroup END

" force sign column always open
" avoids inconsistent buffer widths & jarring transition
set signcolumn=yes

" open full urls w/ `gx`
" Use whole words when opening URLs, avoids cutting off query parameters
" (`?<query parameter>`) and anchors (`#<anchor>`)
" ref - http://vi.stackexchange.com/q/2801/1631
let g:netrw_gx="<cWORD>"

" have vim highlight `<>`
" ref - http://vim.1045645.n5.nabble.com/Highlighting-matching-angle-brackets-lt-gt-td1188629.html
set matchpairs+=<:>

" persist history across opens
set undofile

" be as terse as possible
set shortmess+=a

" case sensitive if the search contains capitals (requires setting ignorecase)
" to search for a whole word -> /\<word\>
" to search lowercase sensitive -> /word\C (`\C` can be anywhere)
set ignorecase
set smartcase
