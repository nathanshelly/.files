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
" shift keys right (+ move by screen line only in normal mode)
" k -> j (+ g only in normal mode)
" l -> k (+ g only in normal mode)

" up
nnoremap k gj
onoremap k j
vnoremap k j

" up
nnoremap l gk
onoremap l k
vnoremap l k

" jump paragraphs with K/L
nnoremap K }
vnoremap K }
nnoremap L {
vnoremap L {

" for now remap old bindings (just in normal mode)
nnoremap { K
nnoremap } J

" <<<< end of home row movement keys remapping >>>>

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
noremap s "
" z -> _ register (more accessible black hole register)
noremap sz "_

" use `x` for jumping to marks (instead of `'`)
noremap x '

" <<<<<< leader >>>>>>

" save, quit, reload, save & quit, exit w/ error, close buffer
nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>q :q<CR>
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
