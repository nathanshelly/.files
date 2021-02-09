{ config, pkgs, ... }:

let
  HOME = "${builtins.getEnv "HOME"}";
  USER = "${builtins.getEnv "USER"}";
  DOTFILES = "${HOME}/.files";
  SHOULD_INSTALL_NATHAN_SPECIFIC_CONFIG = builtins.pathExists "${HOME}/.nathan";
in
{
  # TODO: conditionally spread work zsh config
  home.sessionVariables = if builtins.pathExists "${HOME}/work"
  then (import ./work.nix).home.sessionVariables
  else {};

  # creates symlinks to immutable copies of the source file in /nix/store
  # form: "<target>".source = "<source>"
  home.file = {
    ".tmux.conf".source = "${DOTFILES}/tmux/tmux.conf";

    ##### neovim #####
    # extra configuration for `coc.nvim` plugin
    "${config.xdg.configHome}/nvim/coc-settings.json".source = "${DOTFILES}/neovim/coc-settings.jsonc";
    # custom colorscheme
    "${config.xdg.configHome}/nvim/colors/n.vim".source = "${DOTFILES}/neovim/colors/n.vim";
  } // (
    if SHOULD_INSTALL_NATHAN_SPECIFIC_CONFIG
    then (import ./nathan.nix).home.file
    else {}
  ) // (
    if pkgs.stdenv.isDarwin && SHOULD_INSTALL_NATHAN_SPECIFIC_CONFIG
    then (import ./gui.nix).home.file
    else {}
  );

  programs.ssh = (
    if SHOULD_INSTALL_NATHAN_SPECIFIC_CONFIG
    then (import ./nathan.nix).programs.ssh
    else {}
  );

  # configures shell hook to initialize direnv for zsh + nix-direnv integration
  # refs:
  # - https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  # - direnv - https://direnv.net/
  programs.direnv = {
    enable = true;

    # configure $HOME/.config/direnv/direnvrc to source nix-direnv initialization
    # ref - https://github.com/nix-community/nix-direnv#via-home-manager
    enableNixDirenvIntegration = true;
  };

  # sources completions and key-bindings in interactive zsh sessions
  # ref - https://rycee.gitlab.io/home-manager/options.html#opt-programs.fzf.enable
  programs.fzf.enable = true;

  programs.git = import ./git.nix;

  # let Home Manager install and manage itself
  programs.home-manager.enable = true;

  programs.neovim = import ./editor.nix pkgs;

  programs.zsh = {
    enable = true;

    # TODO: apply conditionally based on user config, rewritten in nix
    defaultKeymap = "viins";

    initExtra = builtins.concatStringsSep "\n" [
      (builtins.readFile "${DOTFILES}/zsh/zshrc")
      # TODO: see if there's a better way to do this
      "source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh"
    ];
    envExtra = builtins.readFile "${DOTFILES}/zsh/zshenv";

    shellAliases = {
      # `exa` - prettier replacement for `ls`
      # options - https://github.com/ogham/exa#options
      l = "exa";
      la = "exa --all";
      ll = "exa --long --all";

      "," = "comma";
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
  home.stateVersion = "20.09";
}
