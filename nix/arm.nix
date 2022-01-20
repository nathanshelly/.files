USER:

{ m1Ize }:

{ config, pkgs, ... }:

let
  # ref: https://github.com/LnL7/nix-darwin/issues/334#issuecomment-858727911
  m1Pkgs = m1Ize pkgs config;
  brewBinPrefix = if pkgs.system == "aarch64-darwin" then "/opt/homebrew/bin" else "/usr/local/bin";
in

  # configuration for `nix-darwin` - https://github.com/lnl7/nix-darwin
{
  # TODO: add keyboard shortcuts - https://github.com/LnL7/nix-darwin/pull/189

  # TODO: - package & install natasha-codes font
  # https://daiderd.com/nix-darwin/manual/index.html#opt-fonts.enableFontDir

  # TODO: tmux/vim/zsh - maybe in home-manager instead? any way to use both?
  # - https://daiderd.com/nix-darwin/manual/index.html#opt-programs.tmux.enable

  environment = {
    # use a custom config location
    # ref - https://github.com/lnl7/nix-darwin/wiki/Changing-the-configuration.nix-location
    # TODO: remove w/ flakes
    darwinConfig = "$HOME/.files/nix/darwin.nix";

    shellInit = ''
        eval "$(${brewBinPrefix}/brew shellenv)"
    '';



    # avoid needing to enter `sudo` password on `make apply` (`darwin-rebuild`)
    # https://github.com/LnL7/nix-darwin/issues/165#issuecomment-749682749
    etc."sudoers.d/10-nix-commands".text = let
      commands = [
        "/run/current-system/sw/bin/darwin-rebuild"
        "/run/current-system/sw/bin/nix*"
        "/run/current-system/sw/bin/ln"
        "/nix/store/*/activate"
        "/bin/launchctl"
      ];
      commandsString = builtins.concatStringsSep ", " commands;
    in
      ''
        %admin ALL=(ALL:ALL) NOPASSWD: ${commandsString}
      '';

    # TODO: figure out how to add user-profile `zsh`
    shells = [ pkgs.zsh ];
  };

  # user environment management via home-manager
  # - https://rycee.gitlab.io/home-manager/index.html#sec-install-nix-darwin-module
  # - https://nix-community.github.io/home-manager/nix-darwin-options.html
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "bak";

  nix = {
    buildMachines = [
      {
        hostName = "nix-docker";
        system = "x86_64-linux";
        maxJobs = 1;
        speedFactor = 2;
        supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
        mandatoryFeatures = [];
      }
    ];
    distributedBuilds = true;

    # https://daiderd.com/nix-darwin/manual/index.html#opt-nix.extraOptions
    extraOptions = ''
      # enable flakes - https://zimbatm.com/NixFlakes/#other-systems
      experimental-features = nix-command flakes
      extra-platforms = aarch64-darwin x86_64-darwin

      system = aarch64-darwin

      # protect `nix-direnv` dev environments from being garbage collected
      # ref - https://github.com/nix-community/nix-direnv#via-home-manager
      keep-derivations = true
      keep-outputs = true
    '';

    # enable flakes, an experimental Nix feature
    # https://zimbatm.com/NixFlakes/#other-systems
    package = pkgs.nixFlakes;

    trustedUsers = [ USER ];
  };

  # create /etc/zshrc that activates the nix-darwin environment on shell load
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

    # TODO understand why I can't seem to set these
    # NSGlobalDomain."com.apple.sound.beep.volume" = null;
    # NSGlobalDomain."com.apple.trackpad.scaling" = 3; # max speed

    NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
    NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
    screencapture.location = "$HOME/tmp";
  };

  users.nix.configureBuildUsers = true;

  users.users."${USER}" = {
    # home key here requed for home-manager config to apply
    home = "/Users/${USER}";
    packages = with pkgs; [
      alacritty
      # TODO: https://github.com/haslersn/any-nix-shell#zsh
      any-nix-shell
      # awscli
      asciinema
      bat
      # TODO: add this back when I can compile unstable on macOS
      # bazel
      # TODO: understand why I can't install `bottom` (https://github.com/ClementTsang/bottom)
      # `nix search nixpkgs bottom` shows pkgs.legacyPackages.x86_64-darwin.bottom
      # bottom
      cachix
      darwin.trash
      deno
      dust
      m1Pkgs.exa
      exiftool
      fd
      ffmpeg-full
      delta
      gh
      tig
      gnumake
      gnupg
      gnused
      httpie
      hyperfine
      jiq
      jq
      lua # z.lua dependency
      krew
      kubectx
      kubernetes
      magic-wormhole
      mdcat
      minikube
      ncurses
      nix-index
      nodejs
      nushell
      python3
      ripgrep
      rsync
      ruplacer
      shellcheck
      shfmt
      stern
      syncthing
      tldr
      terraform-lsp
      m1Pkgs.tmux
      tree-sitter
      tokei
      tree
      vim
      vivid
      watchexec
      yarn
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
