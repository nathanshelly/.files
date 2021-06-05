" source plugins.vim first so that resources such as colorschemes are available
" for use in other config files
source $DOTFILES/neovim/plugins.vim


" source after `plugins.vim` for final say on keybindings (source before
" `plugin_config.vim` to set the correct leader)
source $DOTFILES/neovim/keymap.vim
" run before plugin config to to have termguicolors set
source $DOTFILES/neovim/colors.vim
source $DOTFILES/neovim/plugin_config.vim
source $DOTFILES/neovim/fzf.vim
source $DOTFILES/neovim/options.vim
source $DOTFILES/neovim/filetype_specific.vim
source $DOTFILES/neovim/commands.vim
source $DOTFILES/neovim/coc.nvim

" only run if this file is being loaded by `vim` as a `.vimrc`
if !has('nvim')
  source $DOTFILES/neovim/vim_only.vim
endif
