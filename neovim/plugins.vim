" <<<< using vim plug  >>>>
" ref - https://github.com/junegunn/vim-plug

" TODO: use XDG_CONFIG_SHARE
call plug#begin("$HOME/.local/share/nvim/plugged")

" <<<<<<<< plugins >>>>>>>>

" a multipurpose client for language servers (e.g. intellisense, compilation
" errors, formatting), linters, formatters (e.g. prettier or black) and various
" other external shell programs (e.g. shellcheck)
"
" TODO: install `coc.nvim` via home-manager (and possibly individual coc-*
" extensions)
" - https://github.com/nix-community/home-manager/issues/1531
Plug 'neoclide/coc.nvim', {'branch': 'release' }

" << utilities >>

" github copilot AI help
" Plug 'github/copilot.vim'

" Neovim markdown previewer (opens preview in browser)
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" file explorer tree
" TODO: investigate - https://github.com/ms-jpq/chadtree
Plug 'nvim-tree/nvim-tree.lua'

" generate screenshots of code
Plug 'krivahtoo/silicon.nvim', { 'do': './install.sh' }

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
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
" #TODO: use nix or some other tool to install binary vs build from source
" ref: https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" coq.nvim - completion engine
" takes in sources like LSPs | snippets and allows filtering/completion on them
" TODO: revisit when switching to native lsp
" TODO II: compare to https://github.com/hrsh7th/nvim-cmp & https://github.com/noib3/nvim-completion
" TODO III: test out copilot - https://github.com/ms-jpq/coq_nvim/issues/379
" TODO IV: check if this is an issue - https://github.com/ms-jpq/coq_nvim/issues/462
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

" TODO: determine marginal value of this plugin
" TODO: understand why `.envrc` filetype is still bash and also not highlighted
" Plug 'direnv/direnv.vim'

" We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" show scope lines
Plug 'nvim-treesitter/nvim-treesitter-context'

" filetype detection for many languages
Plug 'sheerun/vim-polyglot'

" help bake keyboard shortcuts into muscle memory
" TODO: configure further
Plug 'folke/which-key.nvim'

" requirements for `noice` below
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
" experimental UI for notifications/diagnostics/error messages
Plug 'folke/noice.nvim'

" requirement below
Plug 'nvim-lua/plenary.nvim'
" TODO management
Plug 'folke/todo-comments.nvim'

" pretty diagnostics, errors listing, etc.
Plug 'folke/trouble.nvim'

" << git >>

" git information (blame, diff) in Vim
" note: `sran.vim` is a dependency of `git-p.nvim`
" Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
" Plug 'iamcco/git-p.nvim'

" show git commit for line under cursor (`<leader>gm`)
Plug 'rhysd/git-messenger.vim'

" open current line in github
" note: opens most recent blob so only works if you are downstream of remote
Plug 'ruanyl/vim-gh-line'

" << colors/syntax/languages >>

" color scheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" statusline color scheme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" statusline
" Plug 'feline-nvim/feline.nvim'
" Plug 'Hitesh-Aggarwal/feline_one_monokai.nvim'

" TODO: test icons w/ lightline
" Plug 'itchyny/lightline.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" jsonc filetype - JSON w/ comments
Plug 'neoclide/jsonc.vim'

" " highlight color codes with their color
Plug 'brenoprata10/nvim-highlight-colors'

" TODO: allow unsupported systems?
" insert color from color picker
Plug 'kabbamine/vCoolor.vim'

" jump to documentation
Plug 'keith/investigate.vim'

" jump to documentation
Plug 'tpope/vim-abolish'

call plug#end()
