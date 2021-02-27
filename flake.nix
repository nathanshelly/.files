{
  description = ".files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    # set home-manager's nipxkgs input to the nixpkgs specified in this flake
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:lnl7/nix-darwin/master";
    # set nix-darwin's nipxkgs input to the nixpkgs specified in this flake
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  # read thru this - https://github.com/malob/nixpkgs/blob/master/flake.nix
  outputs = { self, nix-darwin, nixpkgs, home-manager }: {
    darwinConfigurations = let
      generateConfig = { additionalModules }: nix-darwin.lib.darwinSystem {
        modules = [
          home-manager.darwinModules.home-manager
          ./nix/darwin.nix
        ] ++ additionalModules;
      };
    in
      {
        default = generateConfig {};

        gui = generateConfig { additionalModules = [ ./nix/gui.nix ]; };

        nathan = generateConfig { additionalModules = [ ./nix/nathan.nix ]; };

        work = generateConfig {
          additionalModules = [ ./nix/nathan.nix ./nix/work.nix ];
        };
      };
  };
}
