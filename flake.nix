{
  description = ".files";

  inputs = {
    # TODO: switch to unstable once macOS Big Sur support has landed
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";

    home-manager.url = "github:nix-community/home-manager/master";
    # set home-manager's nipxkgs input to the nixpkgs specified in this flake
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:lnl7/nix-darwin/master";
    # set nix-darwin's nipxkgs input to the nixpkgs specified in this flake
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager }:
    {
      # the default config, not specific to any of my machines
      darwinConfigurations.default = nix-darwin.lib.darwinSystem {
        modules = [ home-manager.darwinModules.home-manager ./nix/darwin.nix ];
      };

      # my machines
      darwinConfigurations."smino" = nix-darwin.lib.darwinSystem {
        modules = [ home-manager.darwinModules.home-manager ./nix/darwin.nix ];
      };
      darwinConfigurations."nathan-shelly-od-mac" = nix-darwin.lib.darwinSystem {
        modules = [ home-manager.darwinModules.home-manager ./nix/darwin.nix ];
      };
    };
}
