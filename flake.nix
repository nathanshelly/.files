{
  description = ".files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";

    home-manager.url = "github:nix-community/home-manager";

    nix-darwin.url = "github:lnl7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  # TODO: understand if `nixpkgs` argument here is 20.09 or following nix-darwin
  outputs = { self, nix-darwin, nixpkgs, home-manager }: {
    darwinConfigurations."smino" = nix-darwin.lib.darwinSystem {
      modules = [ ./nix/darwin.nix ];
      # modules = [ home-manager.darwinModules.home-manager ./nix/darwin.nix ];
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
