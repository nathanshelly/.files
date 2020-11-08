{
  description = ".files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";

    home-manager.url = "github:nix-community/home-manager";

    nix-darwin.url = "github:lnl7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager }: {
    darwinConfigurations."smino" = nix-darwin.lib.darwinSystem {
      modules = [ home-manager.darwinModules.home-manager ./nix/darwin.nix ];
    };
  };
}
