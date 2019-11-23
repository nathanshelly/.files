" settings that apply only to `vim`/`vi`, not `neovim`
" `nvim` ignores this file (see the `!has('nvim')` guard in ./vimrc.symlink)
" see list of `nvim` defaults w/ `:h nvim-defaults`

" << neovim defaults >>

" enable filetype detection, plugin and indentation file loading
" ref - https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
filetype plugin indent on

set autoindent

" update open files as they change
set autoread

" background
set background=dark

" normal backspace
" refs:
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

" disable beeping
set belloff=all
" disable screen flash
set t_vb=

" display last line, even when it would go off screen
set display+=lastline

" place to store persistent history
set undodir=~/.vim/undodir

" highlight all matches
set hlsearch
" show matches as you type
set incsearch
