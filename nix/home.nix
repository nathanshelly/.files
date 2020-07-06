{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    asciinema
    bandwhich
    bat
    darwin.trash # TODO: understand behavior on non-Darwin system
    dust
    exa
    exiftool
    fd
    ffmpeg-full
    fzf
    git
    gitAndTools.delta
    gitAndTools.gh
    gitAndTools.hub
    gitAndTools.tig
    gnupg
    hyperfine
    jq
    lua # z.lua dependency
    mdcat
    ncurses
    neovim
    ripgrep
    rsync
    shellcheck
    shfmt
    tldr
    tmux
    tree
    vim
    watchexec
    zsh
  ];

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
