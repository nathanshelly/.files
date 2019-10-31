" <<<<<<<< Remappings >>>>>>>>
" NOTE: <leader> mapped to Space in $DOTFILES/plugins.vim (so that leader
" bindings defined in that file work)

" escape with rolling jk
inoremap jk <esc>
inoremap <esc> <nop>

" disable command mode
" TODO: maybe come up with a nicer solution here
nnoremap q: <nop>

" <<<< home row keys for movement >>>>

" left/right
noremap j h
noremap ; l
" up/down
noremap l k
noremap k j

" remap up/down screen line movement in normal mode
nnoremap gl gk
nnoremap gk gj

" <<<< end of home row movement keys remapping >>>>

" remap `;` -> `h` (repeat last `tfTF` movement) `;` used for home row movement
nnoremap h ;

" start/end of line movement
noremap " ^
noremap ' $
" used in conjunction with `virtualedit` option to move past end of line
noremap $ g$

" disable character level manipulation
nnoremap S <nop>
nnoremap X <nop>

" switch to last buffer
nnoremap <c-x> <c-^>

" remapped below
nnoremap s <nop>
nnoremap R <nop>
nnoremap x <nop>

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

" save, quit, force quit, reload, save & quit, exit w/ error, close buffer
nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>! :q!<CR>
nmap <silent> <leader>e :e<CR>
nmap <silent> <leader>x :x<CR>
nmap <silent> <leader>cq :cq<CR>
nmap <silent> <leader>bd :bd<CR>

" source vimrc (`reload` mnemonic)
nmap <silent> <leader>rld  :source $HOME/.vimrc<CR>

" turn off search highlighting
nmap <silent> <leader>hn  :noh<CR>

" toggle tab highlighting
nmap <silent> <leader>ht  :HiTab<CR>
nmap <silent> <leader>htn :NoHiTab<CR>

" toggle paste mode (`paste yes`, `paste no` mnemonic)
nmap <silent> <leader>py :set paste<CR>
nmap <silent> <leader>pn :set nopaste<CR>

" start/end of screen line movement
nmap <silent> <leader>' g$
nmap <silent> <leader>" g0

" vim split actions
" navigate between vim splits
nnoremap <c-w>j <c-w><Left>
nnoremap <c-w>k <c-w><Down>
nnoremap <c-w>l <c-w><Up>
nnoremap <c-w>; <c-w><Right>

" clear line
nnoremap <leader>d 0D

" strip whitespace
:noremap <leader>tw :TrimWhitespace<cr>

" find the alternate file for the current path and open it
" ref - https://github.com/uptech/alt/#use-with-vim
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>
