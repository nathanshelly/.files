{
  description = "Nathan's darwin system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";

    home-manager.url = "github:nix-community/home-manager";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs, home-manager }: {

    # imports = [ inputs.home-manager.darwinModules.home-manager ];
    darwinConfigurations."smino" = darwin.lib.darwinSystem {
      modules = [ ./nix/darwin.nix ];
      # inputs = { inherit home-manager.darwinModules.home-manager; };
    };
  };
}
