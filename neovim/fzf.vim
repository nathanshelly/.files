" <<<< fzf.vim >>>>
" configuration of `fzf` inside vim
" ref - https://github.com/junegunn/fzf.vim#customization

" << options >>

" :Commits - match `git lv` defined in $DOFTILES/utilities/git/gitconfig
let g:fzf_commits_log_options = '--graph --color=always --decorate --format=
\"%C(cyan)%h%C(reset) - %s %C(blue)(%cr)%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)"'

" :Commands - keybindings to accept and execute
let g:fzf_commands_expect = 'ctrl-space'

let g:fzf_layout = { 'down': '75%' }

" << previews >>
" remap commands to add previews, toggle w/ ctrl-space

" this search reruns ripgrep every time the query is updated, `fzf` does not
" perform any searching, serving only as a selector interface
"
" this search is bound to `Ctrl-f` in normal mode
"
" ref - https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': [
    \ '--preview-window=down:60%',
    \ '--phony',
    \ '--query',
    \ a:query,
    \ '--bind',
    \ 'change:reload:'.reload_command
    \]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" this search dumps all lines in files queried by ripgrep then performs `fzf`'s
" fuzzy search over those lines as you type your query
" refs:
" - https://github.com/junegunn/fzf.vim/#example-rg-command-with-preview-window
" - https://github.com/junegunn/fzf.vim/issues/714#issuecomment-428802659
command! -nargs=* Rg call fzf#vim#grep(
  \ 'rg  --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview({
  \  'options': '--preview-window=down:60% --delimiter : --nth 4..'
  \ })
\)

command! -nargs=? Files call fzf#vim#files(
  \ <q-args>,
  \ fzf#vim#with_preview('down:60%'),
  \ <bang>0
\)

" TODO: figure out why the preview here can't find files
command! -nargs=? Buffers call fzf#vim#buffers(
  \ <q-args>,
  \ fzf#vim#with_preview('down:60%'),
  \ <bang>0
\)

" << end of previews >>

" << keymap >>

" TODO: customize colors
" TODO:
"   - hide w/o changing UI - https://github.com/junegunn/fzf.vim#hide-statusline
"   - customize - https://github.com/junegunn/fzf.vim#custom-statusline
" TODO: understand why the following plug commands don't seem to work
"   - `nnoremap <leader>fzf <plug>(fzf-complete-word)`
"   - `nnoremap <leader>fzf <plug>(fzf-complete-line)`
"   - `nnoremap <leader>fki <plug>(fzf-maps-i)`
" TODO: maybe add completions? - https://github.com/junegunn/fzf.vim#usage
" TODO: map most used command to <leader><space>

" files below current shell directory (same as `fzf`)
nnoremap <c-p> :Files<cr>
" all buffers
nnoremap <c-b> :Buffers<cr>
" lines of files below current shell directory (same as `rg`)
nnoremap <c-f> :RG<cr>
" lines in current buffer
nnoremap <c-l> :BLines<cr>
" files in current repo
nnoremap <c-g> :GFiles<cr>

" command history
nnoremap <leader>hc :History:<cr>
" search history
nnoremap <leader>h/ :History/<cr>
" `v:oldfiles` and open buffers
nnoremap <leader>hi :History<cr>

" less used commands below namespaced w/ `<leader>f` (for `fzf`)
" lines in open buffers
nnoremap <leader>fli :Lines<cr>
nnoremap <leader>fmr :Marks<cr>
" ultisnips provided snippets
" TODO: install ultisnips
nnoremap <leader>fs :Snippets<cr>
" commits
" TODO: install fugitive.vim to enable jumping to commits
" all commits (same as `git log`)
nnoremap <leader>fct :Commits<cr>
" commits for the current buffer
nnoremap <leader>fcb :BCommits<cr>
nnoremap <leader>fcd :Commands<cr>
" normal mode mappings
nnoremap <leader>fmp :Maps<cr>

" various third party commands
" TODO: use any of these navigation ideas?
" ref - https://bluz71.github.io/2018/12/04/fuzzy-finding-in-vim-with-fzf.html#project-navigation
" TODO: add `mru` searching? - https://github.com/pbogut/fzf-mru.vim
