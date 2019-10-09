" <<<< skim.vim >>>>
" skim configuration matches fzf configuration
" ref
" - https://github.com/junegunn/skim.vim
" - https://github.com/lotabout/skim.vim#customization

" << options >>

" :Commits - match `git lv` defined in $DOFTILES/git/gitconfig.symlink
let g:fzf_commits_log_options = '--graph --color=always --decorate --format=
\"%C(cyan)%h%C(reset) - %s %C(blue)(%cr)%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)"'

" :Commands - keybindings to accept and execute
let g:fzf_commands_expect = 'ctrl-space'

let g:fzf_layout = { 'down': '75%' }

" :Rg - add toggleable (w/ Space) preview w/ context
" TODO: allow searching without filename? `--no-filename` Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('down:60%', '?'),
  \   <bang>0)

" :Files - add toggleable (w/ Space) preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('down:60%'), <bang>0)

" << keymap >>

" TODO: customize colors
" TODO:
"   - hide w/o changing UI - https://github.com/junegunn/fzf.vim#hide-statusline
"   - customize - https://github.com/junegunn/fzf.vim#custom-statusline
" TODO: understand why the following plug commands don't seem to work
"   - `nmap <leader>fzf <plug>(fzf-complete-word)`
"   - `nmap <leader>fzf <plug>(fzf-complete-line)`
"   - `nmap <leader>fki <plug>(fzf-maps-i)`
" TODO: maybe add completions? - https://github.com/junegunn/fzf.vim#usage
" TODO: map most used command to <leader><space>

" files below current shell directory (same as `fzf`)
nmap <c-p> :Files<cr>
" all buffers
nmap <c-b> :Buffers<cr>
" lines of files below current shell directory (same as `rg`)
nmap <c-f> :Rg<cr>
" lines in current buffer
nmap <c-l> :BLines<cr>
" files listed by `git status`
nmap <c-g> :GFiles?<cr>

" command history
nmap <leader>hc :History:<cr>
" search history
nmap <leader>h/ :History/<cr>
" `v:oldfiles` and open buffers
nmap <leader>hi :History<cr>

" less used commands below namespaced w/ `<leader>f` (for `fzf`)
" lines in open buffers
nmap <leader>fli :Lines<cr>
nmap <leader>fmr :Marks<cr>
" ultisnips provided snippets
" TODO: install ultisnips
nmap <leader>fs :Snippets<cr>
" commits
" TODO: install fugitive.vim to enable jumping to commits
" all commits (same as `git log`)
nmap <leader>fct :Commits<cr>
" commits for the current buffer
nmap <leader>fcb :BCommits<cr>
nmap <leader>fcd :Commands<cr>
" normal mode mappings
nmap <leader>fmp :Maps<cr>

" various third party commands
" TODO: use any of these navigation ideas?
" ref - https://bluz71.github.io/2018/12/04/fuzzy-finding-in-vim-with-fzf.html#project-navigation
" TODO: add `mru` searching? - https://github.com/pbogut/fzf-mru.vim
