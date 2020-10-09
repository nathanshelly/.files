{ pkgs ? import <nixpkgs>, ... }:

let
  # TODO: make this dynamic
  HOME = builtins.getEnv "HOME";
  DOTFILES = "${HOME}/.files";
  XDG_CONFIG_HOME = "${HOME}/.config";
in
{
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable
  enable = true;

  extraConfig = builtins.readFile "${DOTFILES}/neovim/init.vim";

  # TODO: test this
  extraPython3Packages = ps: with ps; [ black ];

  plugins = with pkgs.vimPlugins; [
    vim-plug

    # a multipurpose client for language servers (e.g. intellisense, compilation
    # errors, formatting), linters, formatters (e.g. prettier or black) and various
    # other external shell programs (e.g. shellcheck)
    # coc-nvim

    # fuzzy finder
    # configuration in ./fzf.vim over ./plugin_config.vim due to complexity
    fzf-vim

    # << motions/operators >>

    # < both operators and motions >

    # < operators >

    # edit surrounding characters
    #
    # - `ys<motion/text object><character>` - surround with given character. For
    #     example, `ysiw'` on `word` will add surrounding `'`s -> `'word'`.
    # - `ds<character>` - delete nearest (innermost) surrounding pair of given
    #     character. For example, `ds(` on `(word)` will delete surrounding `()`s ->
    #     `word`.
    # - `cs<character-to-replace><new-character>` - change nearest (innermost)
    #     surrounding pair of valid surrounding characters into any other valid
    #     surrounding character pairing. For example, `cs"}` on `"word"` changes the
    #     `"`s into `{}` -> `{word}`
    #
    # See further usage examples - https://github.com/tpope/vim-surround
    vim-surround

    # tpope - comment code - `gc<motion>`
    vim-commentary

    # replace - `<register>gr<motion>`, replaces motion text with contents of given
    # register (unnamed register (`_`) if none given)
    ReplaceWithRegister

    # sort w/ `gs<motion>`
    # e.g. `gs2k` sorts down two lines (current + 2 below)
    vim-sort-motion

    # < text objects >

    # this plugin is a dependency for other `kana/vim-textobj-*`
    #
    # see issue explaining for vim-textobj-line
    # - https://github.com/kana/vim-textobj-line/issues/5
    #
    # dependent plugins:
    # - kana/vim-textobj-line
    # - kana/vim-textobj-indent
    vim-textobj-user

    # << utilities >>

    # git wrapper
    vim-fugitive

    # file explorer
    nerdtree
    # {
    # 'on':  'NERDTreeToggle' }

    # repeats plugin actions (vim-commentary,  vim-surround, etc.)
    vim-repeat

    # status line
    lightline-vim

    # << colors/syntax/languages >>

    # statusline color scheme
    onehalf

    # language pack
    vim-polyglot

    # individual languages/syntax
    vim-markdown

    # TODO: allow unsupported systems?
    # insert color from color picker
    # vCoolor-vim

    # provide completions from tmux panes
    tmux-complete-vim
  ];

  vimAlias = true;
  vimdiffAlias = true;
  withNodeJs = true;
}
