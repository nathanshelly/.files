" <<<<<<<< Remappings >>>>>>>>

" escape with rolling jk
inoremap jk <esc>
inoremap <esc> <nop>

" disable command mode
" Note: come back to later
nnoremap q: <nop>

" <<<< home row keys for movement >>>>

" left/right
noremap j h
noremap ; l
" up/down
noremap l k
noremap k j

" remap up/down screen line movement in normal mode
" up/down
nnoremap gl gk
nnoremap gk gj

" jump paragraphs with K/L
nnoremap K }
vnoremap K }
nnoremap L {
vnoremap L {

" for now remap old bindings (just in normal mode)
nnoremap { K
nnoremap } J

" <<<< end of home row movement keys remapping >>>>

" remap `;` -> , (repeat last `tf` movement) since its part of home row movement
" overwriting `,` (repeat last `tf` movement in opposite direction)
nnoremap , ;

" start/end of line movement
noremap " ^
noremap ' $

" use Ctrl-k/l to scroll screen
noremap <c-k> <c-e>
noremap <c-l> <c-y>

" disable character level manipulation
nnoremap s <nop>
nnoremap S <nop>
nnoremap r <nop>
nnoremap R <nop>
nnoremap x <nop>
nnoremap X <nop>

" use `s` for buffer selection (instead of `"`)
nnoremap s "
" z -> _ register (more accessible black hole register)
noremap sz "_

" use `x` for jumping to marks (instead of `'`)
nnoremap x '

" use `r` instead of `q` for recording macros
nnoremap r q
nnoremap q <nop>
" use `R` to repeat last macro
nnoremap R @@

" <<<<<< leader >>>>>>

" save, quit, force quit, reload, save & quit, exit w/ error, close buffer
nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>! :q!<CR>
nmap <silent> <leader>e :e<CR>
nmap <silent> <leader>x :x<CR>
nmap <silent> <leader>cq :cq<CR>
nmap <silent> <leader>bd :bd<CR>

" source vimrc
nmap <silent> <leader>r  :source ~/.vimrc<CR>

" turn off search highlighting
nmap <silent> <leader>n  :noh<CR>

" toggle tab highlighting
nmap <silent> <leader>ht  :HiTab<CR>
nmap <silent> <leader>htn :NoHiTab<CR>

" toggle paste mode
nmap <silent> <leader>p  :set paste<CR>
nmap <silent> <leader>pn :set nopaste<CR>

" look up word under cursor
nmap <silent> <leader>d {

" start/end of screen line movement
nmap <silent> <leader>' g$
nmap <silent> <leader>" g0

" sort w/ leader
nmap <leader>so :sort<CR>
