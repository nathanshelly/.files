" <<<<<<<< installation >>>>>>>>
"
" <<<< using vim plug  >>>>
" ref - https://github.com/junegunn/vim-plug

" automatic installation
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" <<<< plugins >>>>

call plug#begin()

" typescript support
" refs:
"   - https://github.com/prettier/vim-prettier
"   - https://github.com/peitalin/vim-jsx-typescript
Plug 'leafgarland/typescript-vim' | Plug 'peitalin/vim-jsx-typescript'

" post install (yarn install | npm install) then load plugin only for editing
" supported files
" ref - https://github.com/prettier/vim-prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Neovim markdown previewer (opens preview in browser)
" ref - https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" git information (blame, diff) in Vim
" ref - https://github.com/iamcco/git-p.nvim
Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
Plug 'iamcco/git-p.nvim'

" edit surrounding characters
" ref - https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" repeat plugin actions
" ref - https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" distraction free writing
" ref - https://github.com/junegunn/goyo.vim
" TODO: figure out color issue on exit:
"   - https://github.com/junegunn/goyo.vim/issues/160
"   - https://github.com/junegunn/goyo.vim/issues?utf8=%E2%9C%93&q=exit
Plug 'junegunn/goyo.vim'

" highlight currently editing text
" ref - https://github.com/junegunn/limelight.vim
Plug 'junegunn/limelight.vim'

" Powershell syntax highlighting
" ref - https://github.com/PProvost/vim-ps1
Plug 'PProvost/vim-ps1'

" comment code
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" highlight whitespace
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" <<<<<<<< config >>>>>>>>

" <<<< git-p.nvim (git info) >>>>
" ref - https://github.com/iamcco/git-p.nvim#usage--config

" << options >>

let g:gitp_blame_format = '  %{account} ~ %{ago} • %{commit}'

" << keymap >>

" use <leader>d to display change
" TODO: figure out what's going wrong here, start by not shadowing shortcut
nmap <leader>d <Plug>(git-p-diff-preview)

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

" <<<< vim-better-whitespace >>>>
" ref - https://github.com/ntpeters/vim-better-whitespace#usage
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
