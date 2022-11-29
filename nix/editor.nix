{ pathToDotfiles, ... }:

{
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable
  enable = true;

  # TODO: consider wrapping neovim package for runtime dependencies
  # https://git.sr.ht/~rycwo/workspace/blob/39844721282d5a81710b026b71b907c3df20140c/nixos/user/pkgs/neovim/default.nix

  extraConfig = builtins.readFile "${pathToDotfiles}/neovim/init.vim";

  # TODO: figure out what's not working here
  # extraPython3Packages = ps: with ps; [ black ];


  # packages used only for nvim, these are not added to $PATH
  # extraPackages = with pkgs; [
  #   rnix-lsp
  # ];

  # Use Neovim nightly (0.5.0) package provided by Nix Flake in Neovim repo, and made available via
  # an overlay, see `../flake.nix`.
  # package = pkgs.neovim;

  # plugins = with pkgs.vimPlugins; [
  #   # << motions/operators >>

  #   # << operators >>

  #   # replace - `<register>gr<motion>`, replaces motion text with contents of given
  #   # register (unnamed register (`_`) if none given)
  #   ReplaceWithRegister

  #   # tpope - comment code - `gc<motion>`
  #   vim-commentary

  #   # sort w/ `gs<motion>`
  #   # e.g. `gs2k` sorts down two lines (current + 2 below)
  #   vim-sort-motion

  #   # edit surrounding characters
  #   #
  #   # - `ys<motion/text object><character>` - surround with given character. For
  #   #     example, `ysiw'` on `word` will add surrounding `'`s -> `'word'`.
  #   # - `ds<character>` - delete nearest (innermost) surrounding pair of given
  #   #     character. For example, `ds(` on `(word)` will delete surrounding `()`s ->
  #   #     `word`.
  #   # - `cs<character-to-replace><new-character>` - change nearest (innermost)
  #   #     surrounding pair of valid surrounding characters into any other valid
  #   #     surrounding character pairing. For example, `cs"}` on `"word"` changes the
  #   #     `"`s into `{}` -> `{word}`
  #   #
  #   # See further usage examples - https://github.com/tpope/vim-surround
  #   {
  #     plugin = vim-surround;
  #     config = ''
  #       " <<<< vim-surround >>>>
  #       " ref - https://github.com/tpope/vim-surround#surroundvim

  #       " << keymap >>

  #       " add keystrokes to surround with `<>`
  #       " e.g. `ysss` surrounds the current line w/ `<>` w/o spaces, `yssS` surrounds w/
  #       " `<>` w/ spaces
  #       let g:surround_{char2nr('s')} = "<\r>"
  #       let g:surround_{char2nr('S')} = "< \r >"

  #     '';
  #   }

  #   # < text objects >

  #   # this plugin is a dependency for other `kana/vim-textobj-*`
  #   #
  #   # see issue explaining for vim-textobj-line
  #   # - https://github.com/kana/vim-textobj-line/issues/5
  #   #
  #   # dependent plugins:
  #   # - kana/vim-textobj-line
  #   # - kana/vim-textobj-indent
  #   vim-textobj-user

  #   # << utilities >>

  #   # fuzzy finder
  #   # configuration in ./fzf.vim over ./plugin_config.vim due to complexity
  #   fzf-vim

  #   # status line
  #   lightline-vim

  #   # file explorer
  #   {
  #     plugin = nerdtree;
  #     config = ''
  #       " ref - https://github.com/scrooloose/nerdtree#faq-here-and-in-the-wiki
  #       noremap <c-n> :NERDTreeToggle<CR>

  #       " highlight current file in tree
  #       noremap <leader>ntf :NERDTreeFind<CR>
  #     '';
  #   }

  #   # TODO: move to here after figuring out bugs
  #   # {
  #   #   # perform highlighting, incremental selection, indentation and folding via
  #   #   # the far more efficient treesitter AST
  #   #   plugin = nvim-treesitter;
  #   #   config = ''
  #   #     " ref - https://github.com/nvim-treesitter/nvim-treesitter#modules
  #   #     lua <<EOF
  #   #     require'nvim-treesitter.configs'.setup {
  #   #       -- "all", "maintained" (parsers with maintainers), or a list of languages
  #   #       ensure_installed = "maintained",
  #   #       highlight = { enable = true },
  #   #       incremental_selection = { enable = true },
  #   #       indent = { enable = true },
  #   #       playground = { enable = true }
  #   #     }
  #   #     EOF
  #   #   '';
  #   # }

  #   # {
  #   #   plugin = nvim-treesitter-context;
  #   #   config = ''
  #   #     " toggle on/off
  #   #     nnoremap <leader>cd :TSContextDisable<CR>
  #   #     nnoremap <leader>ce :TSContextEnable<CR>
  #   #   '';
  #   # }

  #   # provide completions from tmux panes
  #   tmux-complete-vim

  #   # git wrapper
  #   vim-fugitive

  #   # repeats plugin actions (vim-commentary,  vim-surround, etc.)
  #   vim-repeat

  #   # << colors/syntax/languages >>

  #   # statusline color scheme
  #   # onehalf

  #   # TODO: allow unsupported systems?
  #   # insert color from color picker
  #   # vCoolor-vim

  #   # TODO: understand why this doesn't seem to work
  #   # filetype detection for most languages */
  #   # {
  #   #   plugin = vim-polyglot;
  #   #   config = ''
  #   #     " disable `markdown` to use `tpope/vim-markdown`
  #   #     "
  #   #     " TODO: try to avoid loading unnecessary syntax highlighting
  #   #     " https://github.com/sheerun/vim-polyglot#troubleshooting
  #   #     let g:polyglot_disabled = [
  #   #       \ 'autoindent',
  #   #       \ 'markdown',
  #   #       \ 'vim'
  #   #     \]
  #   #   '';
  #   # }
  # ];

  # sets `g:node_host_prog='${nodePackages.neovim}/bin/neovim-node-host`
  # ref - https://github.com/NixOS/nixpkgs/blob/e7b9fc42c8bf284ba6886aacdb81c9af8495f0de/pkgs/applications/editors/neovim/wrapper.nix#L68-L75
  withNodeJs = true;
}
