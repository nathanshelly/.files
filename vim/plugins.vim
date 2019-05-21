" <<<< using vim plug  >>>>
" ref - https://github.com/junegunn/vim-plug

" <<<< installation >>>>
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * plugInstall --sync | source $MYVIMRC
endif

" <<<<<<<< plugins >>>>>>>>

call plug#begin()

" << autocompletion >>

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" << formatting/linting >>

" ale
Plug 'w0rp/ale'

" << motions/operators >>

" edit surrounding characters
Plug 'tpope/vim-surround'
" repeat Plugin actions
Plug 'tpope/vim-repeat'
" comment code
Plug 'tpope/vim-commentary'
" line
" dependency - https://github.com/kana/vim-textobj-line/issues/5
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line'

" << utilities >>

" Neovim markdown previewer (opens preview in browser)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" git information (blame, diff) in Vim
Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
Plug 'iamcco/git-p.nvim'

" fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" distraction free writing
Plug 'junegunn/goyo.vim'

" highlight currently editing text
Plug 'junegunn/limelight.vim'

" open current line in github
" note: opens most recent blob so only works if you are downstream of remote
Plug 'ruanyl/vim-gh-line'

" status line
Plug 'itchyny/lightline.vim'

" << colors/syntax/languages >>

" color scheme
Plug 'joshdick/onedark.vim'

" language pack
Plug 'sheerun/vim-polyglot'

" individual languages/syntax
Plug 'tpope/vim-markdown'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()

" <<<<<<<< config >>>>>>>>

" map leader -> space
" NOTE: done here to enable defining <leader> for plugins
let mapleader=" "

" <<<<<< formatting/linting >>>>>>

" <<<< ale >>>>
" ref - https://github.com/w0rp/ale
" NOTE: currently using only for formatting. May add back linting in the
" future. May switch to using language servers for formatting and remove this
" altogether or use for linting only.

" << options >>

" only apply explicitly specified linters (currently none, effectively disabled)
let g:ale_linters_explicit = 1

let g:ale_fix_on_save = 1

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'typescript': ['prettier'],
  \ 'python': ['black'],
\}

" <<<<<< motions/operators >>>>>>

" <<<< vim-surround >>>>
" ref - https://github.com/tpope/vim-surround#surroundvim

" << keymap >>

" add keystrokes to surround with `<>`
let g:surround_{char2nr('s')} = "<\r>"
let g:surround_{char2nr('S')} = "< \r >"

" <<<<<< utilities >>>>>>

" <<<< git-p.nvim (git info) >>>>
" ref - https://github.com/iamcco/git-p.nvim#usage--config

" << options >>

let g:gitp_blame_format = '  %{account} ~ %{ago} • %{commit}'

" << keymap >>

" use <leader>d to display change
" TODO: figure out what's going wrong here, start by not shadowing shortcut
nmap <leader>d <plug>(git-p-diff-preview)

" <<<< fzf.vim >>>>
" ref - https://github.com/junegunn/fzf.vim#customization

" << options >>

" :Commits - match `git lv` defined in $DOFTILES/git/gitconfig.symlink
let g:fzf_commits_log_options = '--graph --color=always --decorate --format=
\"%C(cyan)%h%C(reset) - %s %C(blue)(%cr)%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)"'

" :Commands - keybindings to accept and execute
let g:fzf_commands_expect = 'ctrl-space'

let g:fzf_layout = { 'down': '75%' }

" :Rg - add toggleable (w/ Space) preview w/ context
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" :Files - add toggleable (w/ Space) preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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

" commands below namespaced w/ `<leader>f` (for `fzf`)
" files listed by `git status`
nmap <leader>fg :GFiles?<cr>
" all buffers
nmap <leader>fb :Buffers<cr>
" lines of files below current shell directory (same as `rg`)
nmap <leader>fr :Rg<cr>
" lines in open buffers
nmap <leader>fli :Lines<cr>
" lines in current buffer
nmap <leader>flb :BLines<cr>
nmap <leader>fmr :Marks<cr>
" `v:oldfiles` and open buffers
nmap <leader>fhi :History<cr>
" command history
nmap <leader>fh: :History:<cr>
" search history
nmap <leader>fh/ :History/<cr>
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


" <<<< goyo.vim & limelight.vim >>>>
" refs:
"   - https://github.com/junegunn/limelight.vim#options
"   - https://github.com/junegunn/goyo.vim#configuration

" << options >>

" TODO: figure out why I can't pass an argument, what passing an argument should
" do, and how to background text fully dark
" https://github.com/junegunn/limelight.vim/issues/27
let g:limelight_conceal_ctermfg = 'Black'

" goyo integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" reset colors on exiting goyo (workaround)
" refs:
"   - https://github.com/junegunn/goyo.vim/issues/160
"   - https://github.com/junegunn/goyo.vim/pull/195
autocmd! User GoyoLeave source $HOME/.vimrc

let g:goyo_height = '66%'
let g:goyo_width = '100%'

" << keymap >>

nmap <leader>jg :Goyo<CR>
nmap <leader>jl :Limelight!!<CR>

" <<<< vim-gh-line >>>>
" ref - https://github.com/ruanyl/vim-gh-line#how-to-use

" << options >>

let g:gh_line_map = '<leader>mgl' " `mgl` for `misc git link`
let g:gh_line_blame_map = '<leader>mgb' " `mgb` for `misc git blame`

" <<<< lightline >>>>
" ref - https://github.com/itchyny/lightline.vim#colorscheme-configuration
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \ },
\ }

" hide readonly component in help pages
" https://github.com/itchyny/lightline.vim#can-i-hide-the-readonly-component-in-the-help-buffer
function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" <<<<<< colors/syntax/languages >>>>>>

" <<<< vim-polyglot >>>>

" << options >>
let g:polyglot_disabled = ['markdown']

" <<<< vim-markdown >>>>
" use `tpope`, not `plasticboy` from `vim-polyglot`

" << options >>

let g:markdown_fenced_languages = [
  \ 'javascript',
  \ 'typescript',
  \ 'python',
  \ 'bash=sh',
  \ 'sh'
\]
