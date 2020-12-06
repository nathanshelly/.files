" <<<< using vim plug  >>>>
" ref - https://github.com/junegunn/vim-plug

" <<<< automatic installation >>>>
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

" <<<<<<<< plugins >>>>>>>>

" TODO: figure out how to specify nested expansion, save in variable?
" if empty(glob("${XDG_DATA_HOME:-${HOME}/.local/share}/nvim/site/autoload/plug.vim"))
call plug#begin("$HOME/.local/share/nvim/plugged")

" a multipurpose client for language servers (e.g. intellisense, compilation
" errors, formatting), linters, formatters (e.g. prettier or black) and various
" other external shell programs (e.g. shellcheck)
"
" TODO: install `coc.nvim` via home-manager (and possibly individual coc-*
" extensions)
" - https://github.com/nix-community/home-manager/issues/1531
Plug 'neoclide/coc.nvim', {'branch': 'release' }

" << autocompletion >>

" Neovim markdown previewer (opens preview in browser)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" git information (blame, diff) in Vim
" note: `sran.vim` is a dependency of `git-p.nvim`
Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
Plug 'iamcco/git-p.nvim'

" show git commit for line under cursor (`<leader>gm`)
Plug 'rhysd/git-messenger.vim'

" fuzzy finder
" configuration is in ./fzf.vim instead of ./plugin_config.vim due to complexity
"
" TODO: maybe point directly to `fzf` installed by `nix`?
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Use Sasha's fork which enables previewing of full files based on community's
" fix - https://github.com/junegunn/fzf.vim/issues/751
" NOTE: unless you care about the issue in the above github link I recommend you
" use the canonical 'junegunn/fzf.vim` repo: `Plug 'junegunn/fzf.vim'`
" TODO: check that this fork stays up to date with upstream
" Plug 'sashaweiss/fzf.vim', { 'branch': 'preview_fix' }

" open current line in github
" note: opens most recent blob so only works if you are downstream of remote
Plug 'ruanyl/vim-gh-line'

" << colors/syntax/languages >>

" statusline color scheme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" jsonc filetype - JSON w/ comments
Plug 'neoclide/jsonc.vim'

" individual languages/syntax
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" highlight color codes with their color
" run `:ColorHighlight` to see #FF00AA with a hot pink background
Plug 'chrisbra/Colorizer'

" TODO: allow unsupported systems?
" insert color from color picker
Plug 'kabbamine/vCoolor.vim'

call plug#end()
