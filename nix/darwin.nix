{ config, pkgs, ... }:

# configuration for `nix-darwin`
# ref - https://github.com/lnl7/
let
  USER = "${builtins.getEnv "USER"}";
in
{
  # TODO: add keyboard shortcuts - https://github.com/LnL7/nix-darwin/pull/189

  # TODO: - package & install natasha-codes font
  # https://daiderd.com/nix-darwin/manual/index.html#opt-fonts.enableFontDir

  # TODO: maybe set up nix-index for command not found helper?
  #   - https://github.com/bennofs/nix-index
  #   - https://daiderd.com/nix-darwin/manual/index.html#opt-programs.nix-index.enable

  # TODO: tmux/vim/zsh - maybe in home-manager instead? any way to use both?
  # - https://daiderd.com/nix-darwin/manual/index.html#opt-programs.tmux.enable

  # use a custom config location
  # ref - https://github.com/lnl7/nix-darwin/wiki/Changing-the-configuration.nix-location
  environment = {
    darwinConfig = "$HOME/.files/nix/darwin.nix";

    # TODO
    # refs:
    # - https://discourse.nixos.org/t/using-nix-to-install-login-shell-on-non-nixos-platform/2807/2
    # - https://github.com/rycee/home-manager/issues/1226
    # environment.systemPackages = [ pkgs.zsh ];
    # shells = [
    #   # TODO: figure out how to reference user packages
    #   # config.users.users.nathan.packages.zsh
    # ];

    # TODO: understand how this is possibly supposed to work
    # check existence of `$HOME/.nathan` file?
    # figure out how to spread attribute sets
    # ref - https://daiderd.com/nix-darwin/manual/index.html#opt-environment.systemPath
    # environment.systemPath = import ./work.nix
    # systemPath = [] ++ (
    #   if builtins.pathExists "${builtins.getEnv "HOME"}/work"
    #   then (import ./work.nix).darwin.environment.systemPath
    #   else []
    # );
  };


  # user environment management via home-manager
  # - https://rycee.gitlab.io/home-manager/index.html#sec-install-nix-darwin-module
  # imports = [ inputs.home-manager.darwinModules.home-manager ];
  # # TODO: remove when switching to flake-based nix-darwin installer
  imports = [ <home-manager/nix-darwin> ];
  home-manager.users."${USER}" = import ./home.nix;
  home-manager.useUserPackages = true;

  # protect `nix-direnv` dev environments from being garbage collected
  # ref - https://github.com/nix-community/nix-direnv#via-home-manager
  #
  # manual - https://daiderd.com/nix-darwin/manual/index.html#opt-nix.extraOptions
  nix.extraOptions = ''
    keep-derivations = true
    keep-outputs = true
    # enable flakes - https://zimbatm.com/NixFlakes/#other-systems
    experimental-features = nix-command flakes ca-references
  '';

  # enable flakes, an experimental Nix feature
  # https://zimbatm.com/NixFlakes/#other-systems
  # TODO: confirm I don't also need this in user packages below
  nix.package = pkgs.nixFlakes;

  nix.trustedUsers = [ USER ];

  # create /etc/zshrc that loads the nix-darwin environment
  # TODO: test if this is necessary
  programs.zsh.enable = true;

  # auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  #######################
  # macOS settings config
  # ref - https://daiderd.com/nix-darwin/manual/index.html#opt-system.defaults..GlobalPreferences.com.apple.sound.beep.sound
  #######################
  system.defaults = {
    dock.autohide = true;

    # enable key repeat on hold (instead of special characters popup)
    NSGlobalDomain.ApplePressAndHoldEnabled = false;
    # show all file extensions in Finder
    NSGlobalDomain.AppleShowAllExtensions = true;

    NSGlobalDomain._HIHideMenuBar = true;

    # TODO: use below defaults once upgraded
    # https://daiderd.com/nix-darwin/manual/index.html#opt-system.defaults.NSGlobalDomain.com.apple.trackpad.scaling
    # system.defaults.NSGlobalDomain.com.apple.sound.beep.volume = 0;
    # system.defaults.NSGlobalDomain.com.apple.trackpad.scaling = 3; # max speed
    # system.defaults.NSGlobalDomain.com.apple.trackpad.scaling = 3;
    NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
    NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
    screencapture.location = "$HOME/Downloads";
  };



  users.users."${USER}" = {
    home = "/Users/${USER}";
    description = "Current user";
    packages = with pkgs; [
      alacritty
      asciinema
      bat
      bazel
      darwin.trash # TODO: understand behavior on non-Darwin system
      dust
      exa
      exiftool
      fd
      ffmpeg-full
      gitAndTools.delta
      gitAndTools.gh
      gitAndTools.tig
      gnumake
      gnupg
      hyperfine
      jq
      lua # z.lua dependency
      mdcat
      ncurses
      nodejs
      python3
      ripgrep
      rnix-lsp
      rsync
      shellcheck
      shfmt
      syncthing
      tldr
      tmux
      tokei
      tree
      vim
      watchexec
      yarn
    ];
    # TODO: understand how to get this to work
    # shell = pkgs.zsh;
  };

  users.users.test = {
    home = "/Users/test";
    description = "Test User";
    shell = pkgs.zsh;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
