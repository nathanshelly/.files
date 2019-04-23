" <<<< using vim plug  >>>>
" ref - https://github.com/junegunn/vim-plug

" <<<< installation >>>>
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
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
" repeat plugin actions
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

" distraction free writing
Plug 'junegunn/goyo.vim'

" highlight currently editing text
Plug 'junegunn/limelight.vim'

" open current line in github
" note: opens most recent blob so only works if you are downstream of remote
Plug 'ruanyl/vim-gh-line'

" << colors/syntax >>

Plug 'joshdick/onedark.vim'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-markdown'

call plug#end()

" <<<<<<<< config >>>>>>>>

" <<<< language-client >>>>

" let g:LanguageClient_serverCommands = {
"   \ 'typescript.tsx': ['typescript-language-server', '--stdio']
" \ }

" " << options >>

" " lighten line numbers for increased visibility
" hi LanguageClientError ctermfg=196
" hi LanguageClientWarning ctermfg=219
" hi LanguageClientHint ctermfg=180

" let g:LanguageClient_diagnosticsDisplay = {
"   \ 1: {
"     \ "name": "Error",
"     \ "texthl": "LanguageClientError",
"     \ "signText": "◉",
"     \ "signTexthl": "LanguageClientError",
"     \ "virtualTexthl": "LanguageClientError",
"   \ },
"   \ 2: {
"     \ "name": "Warning",
"     \ "texthl": "LanguageClientWarning",
"     \ "signText": "◉",
"     \ "signTexthl": "LanguageClientWarning",
"     \ "virtualTexthl": "LanguageClientWarning",
"   \ },
"   \ 4: {
"     \ "name": "Hint",
"     \ "texthl": "LanguageClientHint",
"     \ "signText": "◉",
"     \ "signTexthl": "LanguageClientHint",
"     \ "virtualTexthl": "LanguageClientHint",
"   \ }
" \ }

" " << keymap >>

" nnoremap <leader>c :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

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
nmap <leader>d <Plug>(git-p-diff-preview)

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

" <<<<<< colors/syntaxlanguages

" <<<< vim-polyglot >>>>
" use `tpope`, not `plasticboy` from `vim-polyglot`

" << options >>
let g:polyglot_disabled = ['markdown']

" <<<< vim-markdown >>>>
" ref - tpope/vim-markdown

" << options >>

let g:markdown_fenced_languages = [
  \ 'javascript',
  \ 'typescript',
  \ 'python',
  \ 'bash=sh',
  \ 'sh'
\]
