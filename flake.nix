{
  description = ".files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";

    # TODO: move more packages to unstable once Big Sur support has fully landed
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    # set home-manager's nipxkgs input to the nixpkgs specified in this flake
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:lnl7/nix-darwin/master";
    # set nix-darwin's nipxkgs input to the nixpkgs specified in this flake
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, nixpkgs-unstable, home-manager }: {
    foo = {
      bat = nixpkgs.bat;
    };


    darwinConfigurations."smino" = nix-darwin.lib.darwinSystem {
      # modules = [ ./nix/darwin.nix ];
      modules = [
        home-manager.darwinModules.home-manager
        ./nix/darwin.nix
      ] ++ [
        {
          users.users.nathan = {
            # home key here requed for home-manager config to apply
            home = "/Users/nathan";
            packages = [
              # alacritty
              # asciinema
              nixpkgs.bat
              # bat
              # bazel
              # bottom
              # darwin.trash
              # dust
              # exa
              # exiftool
              # fd
              # ffmpeg-full
              # gitAndTools.delta
              # gitAndTools.gh
              # gitAndTools.tig
              # gnumake
              # gnupg
              # hyperfine
              # jq
              # lua # z.lua dependency
              # # nixpkgs-unstable.glow
              # ncurses
              # nix-index
              # nodejs
              # nushell
              # python3
              # ripgrep
              # rsync
              # shellcheck
              # shfmt
              # syncthing
              # # tool for viewing small, community-maintained help pages similar to `man`
              # # `tealdeer` is a faster reimplemntation of the original `tldr`
              # tealdeer
              # tmux
              # tokei
              # tree
              # vim
              # watchexec
              # yarn
            ];
          };
        }
      ];
      # inputs.nipxkgs-unstable = nixpkgs-unstable;
    };
    darwinConfigurations."nathan-shelly-od-mac" = nix-darwin.lib.darwinSystem {
      # modules = [ ./nix/darwin.nix ];
      modules = [ home-manager.darwinModules.home-manager ./nix/darwin.nix ];
    };
    # technically `nix-darwin` looks for a config specified by hostname
    # (not sure when, if ever, that's different from $HOST)
    # TODO: figure out how to actually make generic/universal config
    darwinConfigurations."${builtins.getEnv "HOST"}" = nix-darwin.lib.darwinSystem {
      modules = [ ./nix/darwin.nix ];
      # modules = [ home-manager.darwinModules.home-manager ./nix/darwin.nix ];
    };
  };
}
