" plugins.vim must be sourced first so that resources such as colorschemes
" are available for use in other config files
source $DOTFILES/neovim/plugins.vim
source $DOTFILES/neovim/plugin_config.vim

" TODO: move this to `vim` specific-setup
if !has('nvim')
  source $DOTFILES/neovim/vim_only.vim
endif

source $DOTFILES/neovim/fzf.vim
source $DOTFILES/neovim/options.vim
source $DOTFILES/neovim/colors.vim
source $DOTFILES/neovim/keymap.vim
source $DOTFILES/neovim/commands.vim
source $DOTFILES/neovim/coc.nvim
