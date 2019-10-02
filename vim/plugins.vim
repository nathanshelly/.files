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

" << motions/operators >>

" < both operators and motions >

" a grab bag of useful normal mode keybindings
"
" here are the ones that interest me enough to install this (time will tell if I
" actually use any of them):
"
" - `[f` - open preceding file alphabetically in the current file's directory
" - `]f` - open succeeding file alphabetically in the current file's directory
" - `<count>[<Space>` - add <count> blank lines above cursor
" - `<count>]<Space>` - add <count> blank lines below cursor
" - `<count>[e` - exchange current line with <count> lines above
" - `<count>]e` - exchange current line with <count> lines below
" - `[p` - paste above the cursor maintaining indentation
" - `[p` - paste below the cursor maintaining indentation
" - `[u<motion>` or `[uu` - URL encode, e.g. foo bar => foo%20bar
" - `]u<motion>` or `]uu` - URL decode, e.g. foo bar => foo%20bar
"
" ref - https://github.com/tpope/vim-unimpaired
Plug 'tpope/vim-unimpaired'

" < operators >

" edit surrounding characters
Plug 'tpope/vim-surround'
" comment code
Plug 'tpope/vim-commentary'
" converts between number representations - decimal <> hex <> octal <> binary
" - `gA` shows all representations of the number under the cursor
" - `crd`, `crx`, `cro` & `crb` convert the number under the cursor to decimal,
"    hex, octal & binary, respectively
Plug 'glts/vim-magnum' | Plug 'glts/vim-radical'

" < motions >

" line (inner `il` & around `al`)
"
" adds two text objects:
" <operator>il - delete line from level of indentation. For example:
" ```
" // `dal` & `dil` do the same on the below line
" text here
"   // on example 'some indented text here' line below
"   // `dal` deletes whole line including whitespace (same effect as `cc`)
"   // `dil` preserves the white space and deletes everything else
"   some indented text here
" more text here
" ```
"
" this line object depends on `kana/vim-textobj-user`
" ref - https://github.com/kana/vim-textobj-line/issues/5
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line'

" << utilities >>

" repeats plugin actions (vim-commentary,  vim-surround, etc.)
Plug 'tpope/vim-repeat'

" Neovim markdown previewer (opens preview in browser)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" git information (blame, diff) in Vim
Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
Plug 'iamcco/git-p.nvim'

" fuzzy finder
Plug '/usr/local/opt/fzf'
" Use Sasha's fork which enables previewing of full files based on community's
" fix - https://github.com/junegunn/fzf.vim/issues/751
" TODO: check that this fork stays up to date with upstream
Plug 'sashaweiss/fzf.vim', { 'branch': 'preview_fix' }

" distraction free writing
Plug 'junegunn/goyo.vim'

" highlight currently editing text
Plug 'junegunn/limelight.vim'

" open current line in github
" note: opens most recent blob so only works if you are downstream of remote
Plug 'ruanyl/vim-gh-line'

" status line
Plug 'itchyny/lightline.vim'

" universal REPL
Plug 'metakirby5/codi.vim'

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

" <<<<<< motions/operators >>>>>>

" <<<< vim-surround >>>>
" ref - https://github.com/tpope/vim-surround#surroundvim

" << keymap >>

" add keystrokes to surround with `<>`
let g:surround_{char2nr('s')} = "<\r>"
let g:surround_{char2nr('S')} = "< \r >"

" <<<<<< end of config >>>>>>

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
  \             [ 'readonly', 'filename', 'modified' ],
  \             [ 'cocstatus', 'currentfunction' ] ]
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
\ }

" hide readonly component in help pages
" https://github.com/itchyny/lightline.vim#can-i-hide-the-readonly-component-in-the-help-buffer
function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" <<<< markdown-preview >>>>

nmap <leader>mp :MarkdownPreview<CR>

" <<<<<< end of utilities >>>>>>

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

" <<<<<< end of colors/syntax/languages >>>>>>
