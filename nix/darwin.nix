{ config, pkgs, ... }:

# configuration for `nix-darwin`
# ref - https://github.com/lnl7/
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

    # TODO: figure out how to conditionally merge in personal overrides
    # check existence of `$HOME/.nathan` file?
    # figure out how to spread attribute sets
    # ref - https://daiderd.com/nix-darwin/manual/index.html#opt-environment.systemPath
    # environment.systemPath = import ./work.nix
    systemPath = [
      # # python dependency manager
      # [ [ -d "$HOME/.poetry/bin" ] ] && path=("$HOME/.poetry/bin" $path)

      # # put nix profile first on path
      # [ [ -d "/etc/profiles/per-user/$USER/bin" ] ] && {
      # path = ("/etc/profiles/per-user/$USER/bin" $path)
      #   }

      #   # where `pip install --user` installs executables
      #   [[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" $path)

      #   [[ -d "$HOME/.cargo/bin" ]] && path=("$HOME/.cargo/bin" $path) # rust packages
    ];
  };


  # user environment management via home-manager
  # - https://rycee.gitlab.io/home-manager/index.html#sec-install-nix-darwin-module
  imports = [ <home-manager/nix-darwin> ];
  home-manager.users.nathan = import ./home.nix;
  home-manager.useUserPackages = true;

  # protect `nix-direnv` dev environments from being garbage collected
  # ref - https://github.com/nix-community/nix-direnv#via-home-manager
  #
  # manual - https://daiderd.com/nix-darwin/manual/index.html#opt-nix.extraOptions
  nix.extraOptions = ''
    keep-derivations = true
    keep-outputs = true
  '';


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



  users.users.nathan = {
    home = "/Users/nathan";
    description = "Nathan Shelly";
    packages = with pkgs; [
      alacritty
      asciinema
      bandwhich
      bat
      bazel
      darwin.trash # TODO: understand behavior on non-Darwin system
      direnv
      dust
      exa
      exiftool
      fd
      ffmpeg-full
      fzf
      git
      git-lfs
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
      zsh
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
