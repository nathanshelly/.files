" <<<<<<<< Remappings >>>>>>>>
"
" Note: ideally this file would be the sole source of truth for any keymappings.
" Unfortunately, for organization purposes mappings also exist in `./fzf.vim`,
" `./coc.nvim` & `./plugin_config.vim`. Try `grep`ing for `map` to track down
" a specific keymapping (or using `f` if you've set up ripgrep & it's associated
" aliases.
"
" map leader -> space
" Note: this must be sourced before `plugin_config.vim` for keymappings there
" to use the correct leader
let mapleader=" "

" escape with rolling jk
inoremap jk <esc>
" `Ctrl-c` already operates similar to `esc` with the caveat that using it to
" exit insert mode doesn't trigger the `InsertLeave` autocmd. Remapping here
" removes that difference.
" ref - https://stackoverflow.com/a/10757148
inoremap <c-c> <esc>

" start/end of line movement
noremap " ^
noremap ' $
" used in conjunction with `virtualedit` option to move past end of line
noremap $ g$

" switch to last buffer
nnoremap <c-x> <c-^>

" << registers (copy/paste) >>
" use `s` for register selection (instead of `"`)
nnoremap s "
" z -> _ register (more accessible black hole register)
noremap sz "_
" s -> + register (more accessible system clipboard)
noremap ss "+

" use `x` for jumping to marks (instead of `'`)
nnoremap x '

" use `R` to repeat last macro
nnoremap R @@

" <<<<<< leader >>>>>>

" disable Space
" to avoid moving cursor on space (not a prereq to using Space as leader)
nnoremap <Space> <NOP>

" save, quit, force quit, save & quit, exit w/ error, close buffer
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>! :q!<CR>
nnoremap <silent> <leader>e :e<CR>
nnoremap <silent> <leader>x :x<CR>
nnoremap <silent> <leader>cq :cq<CR>
nnoremap <silent> <leader>bd :bd<CR>

" refresh
" ref - https://stackoverflow.com/a/17189261
nnoremap <silent> <leader>r :syntax sync fromstart<cr>

" source vimrc (`reload` mnemonic)
nnoremap <silent> <leader>rld  :source $MYVIMRC<CR>

" turn off search highlighting
nnoremap <silent> <leader>hn  :noh<CR>

" toggle tab highlighting
nnoremap <silent> <leader>ht  :HiTab<CR>
nnoremap <silent> <leader>htn :NoHiTab<CR>

" toggle paste mode (`paste yes`, `paste no` mnemonic)
nnoremap <silent> <leader>py :set paste<CR>
nnoremap <silent> <leader>pn :set nopaste<CR>

" start/end of screen line movement
nnoremap <silent> <leader>' g$
nnoremap <silent> <leader>" g0

" clear line
nnoremap <leader>d 0D

" strip whitespace
noremap <leader>tw :TrimWhitespace<cr>

" find the alternate file for the current path and open it
" ref - https://github.com/uptech/alt/#use-with-vim
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" ref: https://vimtricks.com/p/highlight-specific-lines/
"
" highlight the current line
nnoremap <leader>lh :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
" clear all the highlighted lines
nnoremap <leader>lhn :call clearmatches()<CR>
