{ config, pkgs, ... }:

# configuration for `nix-darwin`
#
{
  # use a custom config location
  # ref - https://github.com/LnL7/nix-darwin/wiki/Changing-the-configuration.nix-location
  environment.darwinConfig = "$HOME/.files/nix/darwin.nix";

  # l
  imports = [ <home-manager/nix-darwin> ];
  home-manager.users.nathan = import ./home.nix;
  home-manager.useUserPackages = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # create /etc/zshrc that loads the nix-darwin environment
  programs.zsh.enable = true;

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
      gitAndTools.hub
      gitAndTools.tig
      gnumake
      gnupg
      hyperfine
      jq
      lua # z.lua dependency
      mdcat
      ncurses
      neovim
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

  # questions
  # - how is nix config interpreted on other systems?
  #   - generic Linux
  #   - NixOS
  #
  # refs
  # - https://git.bytes.zone/brian/dotfiles.nix/src/commit/dd1633e69c90eb6fd9cb8c408488dc24ab76931b/notes/home-manager-with-nix-darwin.org?lang=lv-LV
  # - https://rycee.gitlab.io/home-manager/index.html#sec-install-nix-darwin-module

  # TODO
  # - fix shell management
  # - try with separate non-existent user
  # - figure out who would run this the first time on a new mac if not me, just for sysadmins?
  # refs:
  # - https://discourse.nixos.org/t/using-nix-to-install-login-shell-on-non-nixos-platform/2807/2
  # - https://github.com/rycee/home-manager/issues/1226
  # environment.shells = [ pkgs.zsh ];
  # environment.systemPackages = [ pkgs.zsh ];
  # };

  # TODO:
  # - add keyboard shortcuts - https://github.com/LnL7/nix-darwin/pull/189
  # - package & install natasha-codes font via nix - https://daiderd.com/nix-darwin/manual/index.html#opt-fonts.enableFontDir
  # - path - https://daiderd.com/nix-darwin/manual/index.html#opt-environment.systemPath
  # - environment variables - https://daiderd.com/nix-darwin/manual/index.html#opt-environment.variables
  # - exteranl builder - https://daiderd.com/nix-darwin/manual/index.html#opt-nix.buildMachines
  # - maybe set up nix-index for command not found helper?
  #   - https://github.com/bennofs/nix-index
  #   - https://daiderd.com/nix-darwin/manual/index.html#opt-programs.nix-index.enable
  # - tmux/vim/zsh - maybe in home-manager instead?
  #   - https://daiderd.com/nix-darwin/manual/index.html#opt-programs.tmux.enable

  #######################
  # macOS settings config
  # ref - https://daiderd.com/nix-darwin/manual/index.html#opt-system.defaults..GlobalPreferences.com.apple.sound.beep.sound
  #######################

  system.defaults.dock.autohide = true;

  # enable key repeat on hold (instead of special characters popup)
  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
  # show all file extensions in Finder
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;

  system.defaults.NSGlobalDomain._HIHideMenuBar = true;

  # TODO: see why `system.defaults.NSGlobalDomain.com` errors on `switch`
  # https://daiderd.com/nix-darwin/manual/index.html#opt-system.defaults.NSGlobalDomain.com.apple.trackpad.scaling
  # system.defaults.NSGlobalDomain.com.apple.sound.beep.volume = 0;
  # system.defaults.NSGlobalDomain.com.apple.trackpad.scaling = 3; # max speed
  # system.defaults.NSGlobalDomain.com.apple.trackpad.scaling = 3;
  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
  system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
  system.defaults.screencapture.location = "$HOME/Downloads";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
