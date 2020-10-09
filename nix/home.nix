{ config, pkgs, ... }:

let
  # TODO: make this dynamic
  USERNAME = "nathan";
  HOME = "/Users/${USERNAME}";
  DOTFILES = "${HOME}/.files";
  XDG_CONFIG_HOME = "${HOME}/.config";
  INSTALL_NATHAN_SPECIFIC_CONFIG = builtins.pathExists "${HOME}/.nathan";
in
{
  # TODO: create issue to look into gpg signing
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.git.signing

  # TODO: test exactly what path this affects - path to home-manager config?
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.home-manager.path

  # TODO: manage fonts via fontconfig?
  # fonts.fontconfig.enable = true

  # TODO: figure out how to conditionally apply personal overrides
  # check existence of `$HOME/.nathan` file?
  # figure out how to spread attribute sets - "import ./nathan.nix"

  # TODO: conditionally spread work zsh config
  home.sessionVariables = if builtins.pathExists "${HOME}/work"
  then (import ./work.nix).home.sessionVariables
  else {};

  # TODO: conditionally apply gui config
  # figure out how to spread attribute sets - "import ./gui.nix"

  # creates symlinks to immutable copies of the source file in /nix/store
  # form: "<target>".source = "<source>"
  home.file = {
    # TODO: make sure I can use `home-manager` to link this file
    "${XDG_CONFIG_HOME}/nix/home.nix".source = "${DOTFILES}/nix/home.nix";

    # TODO: experiment with `tmux` module
    ".tmux.conf".source = "${DOTFILES}/tmux/tmux.conf";

    ##### neovim #####
    # extra configuration for `coc.nvim` plugin
    "${XDG_CONFIG_HOME}/nvim/coc-settings.json".source = "${DOTFILES}/neovim/coc-settings.jsonc";
    # custom colorscheme
    "${XDG_CONFIG_HOME}/nvim/colors/n.vim".source = "${DOTFILES}/neovim/colors/n.vim";
  } // (
    if INSTALL_NATHAN_SPECIFIC_CONFIG then (import ./nathan.nix).home.file else {}
  );

  programs.ssh = (
    if INSTALL_NATHAN_SPECIFIC_CONFIG
    then (import ./nathan.nix).programs.ssh
    else {}
  );

  # ref - https://rycee.gitlab.io/home-manager/options.html#opt-programs.command-not-found.enable
  programs.command-not-found.enable = true;

  # configures shell hook to initialize direnv for zsh + nix-direnv integration
  # refs:
  # - https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  # - direnv - https://direnv.net/
  programs.direnv = {
    enable = true;
    # TODO: confirm that this is unnecessary
    enableZshIntegration = true;
    # configure $HOME/.config/direnv/direnvrc to source nix-direnv initialization
    # ref - https://github.com/nix-community/nix-direnv#via-home-manager
    enableNixDirenvIntegration = true;
  };

  # TODO: understand exactly what this does
  # ref - https://rycee.gitlab.io/home-manager/options.html#opt-programs.dircolors.enable
  programs.dircolors.enable = true;

  # sources completions and key-bindings in interactive zsh sessions
  # ref - https://rycee.gitlab.io/home-manager/options.html#opt-programs.fzf.enable
  programs.fzf.enable = true;

  programs.git = import ./git.nix;

  # let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable
  # programs.neovim = {
  #   enable = true;
  #   extraConfig = ''
  #     . $DOTFILES/neovim/init.vim
  #   '';
  #   extraPython3Packages = ps: with ps; [ black ];
  #   plugins = with pkgs.vimPlugins; [
  #     yankring
  #     vim-nix
  #     {
  #       plugin = vim-startify;
  #       config = "let g:startify_change_to_vcs_root = 0";
  #     }
  #   ];
  #   vimAlias = true;
  #   vimdiffAlias = true;
  #   withNodeJs = true;
  # };

  programs.zsh = {
    enable = true;

    # TODO: apply conditionally based on user config, rewritten in nix
    defaultKeymap = "vicmd";
    # TODO: update things to make sure this works
    dotDir = ".config/zsh";

    # TODO: switch these to append the contents of the file instead of sourcing
    initExtra = ". $DOTFILES/zsh/zshrc";
    envExtra = ". $DOTFILES/zsh/zshenv";

    shellAliases = {
      # TODO: conditionally load based on if exa is executable
      # replacement for `ls`
      # ref - https://github.com/ogham/exa
      # command -v exa > /dev/null && {
      # alias l = 'exa'
      #   # options - https://github.com/ogham/exa#options
      #   alias la='l --all'
      # alias ll='l --long --all'
      # } || {
      # # exa not installed

      # # `-F` display characters indicating properties, e.g. `/` for directory
      # alias l='ls -F'
      # # `-A` list all entries except `.` & `..`
      # alias la='ls -AF'
      # # `-l` long format (more details)
      # # `-h` human readable units (byte, kilobyte, etc.)
      # alias ll='ls -AFhl'
      # }


    };

  };

  # this machine-specific value should correspond to the nix version at the time
  # home-manager was first used to set up that machine
  # TODO: abstract this out to machine-specific file

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
