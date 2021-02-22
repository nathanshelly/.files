{ config, pkgs, ... }:

# configuration for `nix-darwin` - https://github.com/lnl7/nix-darwin
let
  DOTFILES_USE_GUI = "${builtins.getEnv "DOTFILES_USE_GUI"}";
  USER = "${builtins.getEnv "USER"}";
  SHOULD_INSTALL_NATHAN_SPECIFIC_CONFIG = builtins.pathExists
    "${builtins.getEnv "HOME"}/.nathan";
in
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

    # ref - https://daiderd.com/nix-darwin/manual/index.html#opt-environment.systemPath
    systemPath = [] ++ (
      if builtins.pathExists "${builtins.getEnv "HOME"}/work"
      then (import ./work.nix).darwin.environment.systemPath
      else []
    );
  };

  homebrew =
    if "${DOTFILES_USE_GUI}" == "true" then
      {
        enable = true;

        # uninstalls formulae & casks that are not listed in the brewfile
        # cleanup = "zap";

        # prevents homebrew from generating useless lock files
        global.noLock = true;

        casks = [
          "1password"
          "alfred"
          "alt-tab"
          "backblaze"
          "bartender"
          "contexts"
          "daisydisk"
          "fantastical"
          "firefox"
          "firefox-nightly"
          "flux"
          "google-chrome"
          "google-backup-and-sync"
          "istat-menus"
          "iterm2"
          "karabiner-elements"
          "keycastr"
          "microsoft-edge"
          "monitorcontrol"
          "mpv"
          "notion"
          "private-internet-access"
          "postman"
          "rectangle"
          "signal"
          "slack"
          "sound-control"
          "spotify"
          "steermouse"
          "tempo"
          "ueli"
          "visual-studio-code"
          "vlc"
        ];
        masApps = if SHOULD_INSTALL_NATHAN_SPECIFIC_CONFIG then {
          # https://apps.apple.com/us/app/xcode/id497799835
          "Xcode" = 497799835;

          # (paid, $5) https://apps.apple.com/us/app/super-easy-timer/id1353137878
          "Super Easy Timer" = 1353137878;

          # (in-app purchases) https://apps.apple.com/us/app/time-out-break-reminders/id402592703
          "Time Out" = 402592703;
        } else {};
      } else {};

  # user environment management via home-manager
  # - https://rycee.gitlab.io/home-manager/index.html#sec-install-nix-darwin-module
  # # TODO: remove when switching to flake-based nix-darwin installer
  # imports = [ <home-manager/nix-darwin> ];
  home-manager.users."${USER}" = import ./home.nix;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

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
      experimental-features = nix-command flakes ca-references

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
      any-nix-shell
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
      nix-index
      python3
      ripgrep
      rsync
      shellcheck
      shfmt
      syncthing
      tldr
      tmux
      tokei
      tree
      vim
      vivid
      watchexec
      yarn
    ];
  };

  # TODO: extend nix-darwin to allow shell setting w/o user recreation
  # users = if SHOULD_INSTALL_NATHAN_SPECIFIC_CONFIG
  # then {
  #   knownUsers = [ USER ];
  #   "${USER}" = {
  #     shell = pkgs.zsh;
  #     uid = 501;
  #   };
  # } else {};

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
