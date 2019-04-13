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

" << languages >>

" typescript/javascript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" powershell
Plug 'PProvost/vim-ps1'
" code blocks in markdown files
Plug 'tpope/vim-markdown'

" << formatting/linting >>

" post install load plugin only for editing supported files
" ref - https://github.com/prettier/vim-prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': [
    \ 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql',
    \ 'markdown', 'vue', 'yaml', 'html'
  \]
\}

" black code formatting (python)
Plug 'ambv/black'

" << motions/operators >>

" edit surrounding characters
Plug 'tpope/vim-surround'
" repeat plugin actions
Plug 'tpope/vim-repeat'
" comment code
Plug 'tpope/vim-commentary'

" << utilities >>

" Neovim markdown previewer (opens preview in browser)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" git information (blame, diff) in Vim
Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
Plug 'iamcco/git-p.nvim'

" highlight whitespace
Plug 'ntpeters/vim-better-whitespace'

" distraction free writing
" TODO: figure out color issue on exit:
"   - https://github.com/junegunn/goyo.vim/issues/160
"   - https://github.com/junegunn/goyo.vim/issues?utf8=%E2%9C%93&q=exit
Plug 'junegunn/goyo.vim'

" highlight currently editing text
Plug 'junegunn/limelight.vim'

" open current line in github
" note: opens most recent blob so only works if you are downstream of remote
Plug 'ruanyl/vim-gh-line'

call plug#end()

" <<<<<<<< config >>>>>>>>

" <<<<<< formatting/linting >>>>>>

" <<<< vim-prettier >>>>
" ref - https://github.com/prettier/vim-prettier#configuration

" force async
let g:prettier#exec_cmd_async = 1
" run pre save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" <<<< black >>>>
" ref - https://github.com/ambv/black#vim

" << options >>

autocmd BufWritePre *.py execute ':Black'

" <<<<<< motions/operators >>>>>>

" <<<< vim-surround >>>>
" ref - https://github.com/tpope/vim-surround#surroundvim

" << keymap >>

" add keystrokes to surround with `<>`
let g:surround_{char2nr('s')} = "<\r>"
let g:surround_{char2nr('S')} = "< \r >"

" <<<<<< utilities >>>>>>

" <<<< vim-markdown >>>>
" ref - tpope/vim-markdown

" << options >>

let g:markdown_fenced_languages = [
      \'javascript',
      \'typescript',
      \'python',
      \'bash=sh',
      \'sh'
\]

" <<<< git-p.nvim (git info) >>>>
" ref - https://github.com/iamcco/git-p.nvim#usage--config

" << options >>

let g:gitp_blame_format = '  %{account} ~ %{ago} • %{commit}'

" << keymap >>

" use <leader>d to display change
" TODO: figure out what's going wrong here, start by not shadowing shortcut
nmap <leader>d <Plug>(git-p-diff-preview)

" <<<< vim-better-whitespace >>>>
" ref - https://github.com/ntpeters/vim-better-whitespace#usage

" << options >>

let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1

" <<<< limelight.vim >>>>
" ref - https://github.com/junegunn/limelight.vim#options

" << options >>

" TODO: figure out why I can't pass an argument, what passing an argument should
" do, and how to background text fully dark
" https://github.com/junegunn/limelight.vim/issues/27
let g:limelight_conceal_ctermfg = 'Black'

" goyo integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" << keymap >>

nmap <leader>g :Goyo<CR>
nmap <leader>l :Limelight!!<CR>

" <<<< vim-gh-line >>>>
" ref - https://github.com/ruanyl/vim-gh-line#how-to-use

" << options >>

let g:gh_line_map = '<leader>mgl' " `mgl` for `misc git link`
let g:gh_line_blame_map = '<leader>mgb' " `mgb` for `misc git blame`
