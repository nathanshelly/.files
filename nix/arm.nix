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
    etc."sudoers.d/10-nix-commands".text =
      let
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
        mandatoryFeatures = [ ];
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
    package = pkgs.nixVersions.stable;

    settings.trusted-users = [ USER ];
  };

  # allow using TouchID to authenticate `sudo`
  #
  # TODO: support `tmux` via `pam-reattatch`
  # ref: https://github.com/LnL7/nix-darwin/pull/228#issuecomment-1212769786
  #
  # ref: https://github.com/LnL7/nix-darwin/pull/228
  security.pam.enableSudoTouchIdAuth = true;

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

  users.users."${USER}" = {
    # home key here requed for home-manager config to apply
    home = "/Users/${USER}";
    packages = with pkgs; [
      alacritty
      # TODO: https://github.com/haslersn/any-nix-shell#zsh
      any-nix-shell
      # awscli
      asciinema
      ffmpeg-full
      delta
      # kubernetes
      magic-wormhole
      watchexec

      m1Pkgs.bash
      m1Pkgs.bat
      # TODO: understand why I can't install `bottom` (https://github.com/ClementTsang/bottom)
      # `nix search nixpkgs bottom` shows pkgs.legacyPackages.x86_64-darwin.bottom
      # bottom
      m1Pkgs.cachix
      m1Pkgs.darwin.trash
      m1Pkgs.deno
      m1Pkgs.du-dust
      m1Pkgs.exa
      m1Pkgs.exiftool
      m1Pkgs.fd
      m1Pkgs.fontforge
      m1Pkgs.gh
      m1Pkgs.jira-cli-go
      m1Pkgs.tig
      m1Pkgs.gnumake
      m1Pkgs.gnupg
      m1Pkgs.gnused
      m1Pkgs.httpie
      m1Pkgs.hyperfine
      m1Pkgs.jiq
      m1Pkgs.jq
      m1Pkgs.lua # z.lua dependency
      m1Pkgs.krew
      m1Pkgs.kubectx
      m1Pkgs.mdcat
      m1Pkgs.minikube
      m1Pkgs.ncurses
      m1Pkgs.nix-index
      m1Pkgs.nodejs
      m1Pkgs.nushell
      m1Pkgs.python3
      m1Pkgs.ripgrep
      m1Pkgs.rsync
      m1Pkgs.ruplacer
      m1Pkgs.rust-analyzer
      # TODO: look into overlays
      # ref: https://nixos.wiki/wiki/Rust
      m1Pkgs.rustc
      m1Pkgs.cargo
      m1Pkgs.sad
      m1Pkgs.shellcheck
      m1Pkgs.shfmt
      m1Pkgs.silicon
      m1Pkgs.stern
      m1Pkgs.sumneko-lua-language-server
      m1Pkgs.syncthing
      m1Pkgs.tealdeer
      # m1Pkgs.terraform-lsp
      m1Pkgs.tmux
      m1Pkgs.tree-sitter
      m1Pkgs.tokei
      m1Pkgs.tree
      m1Pkgs.vim
      m1Pkgs.vivid
      m1Pkgs.yarn
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
