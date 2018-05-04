" <<<<<<<< Remappings >>>>>>>>

" escape with rolling jk
inoremap jk <esc>
inoremap <esc> <nop>

" disable command mode
" Note: come back to later
nnoremap q: <nop>

" << home row keys for movement >>

" left/right
noremap j h
noremap ; l

" up/down
" shift keys right (+ move by display line only in normal mode)
" remap k -> j (+ g only in normal mode)
" remap l -> k (+ g only in normal mode)

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

" start/end of line movement
" Note: this overwrites jumping to marks
" may remap this in the future
noremap " ^
noremap ' $

" <<<< leader >>>>

" source vimrc
nmap <silent> <leader>s  :source ~/.vimrc<CR>

" turn off search highlighting
nmap <silent> <leader>n  :noh<CR>

" toggle tab highlighting
nmap <silent> <leader>ht  :HiTab<CR>
nmap <silent> <leader>htn :NoHiTab<CR>

" toggle paste mode
nmap <silent> <leader>p  :set paste<CR>
nmap <silent> <leader>pn :set nopaste<CR>
