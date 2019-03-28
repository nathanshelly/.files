" <<<< installation >>>>
"
" using vim plug  >>>>
" ref - https://github.com/junegunn/vim-plug

call plug#begin()

" typescript support
" refs:
"   - https://github.com/prettier/vim-prettier
"   - https://github.com/peitalin/vim-jsx-typescript
Plug 'leafgarland/typescript-vim' | Plug 'peitalin/vim-jsx-typescript'

" post install (yarn install | npm install) then load plugin only for editing supported files
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

call plug#end()
