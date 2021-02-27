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
      generateConfig =
        { additionalModules ? []
        , includeGui ? false
        , includeWork ? false
        , HOME ? builtins.getEnv "HOME"
        , USER ? builtins.getEnv "USER"
        }: nix-darwin.lib.darwinSystem {
          # inputs = { flake = self; };
          modules = [
            home-manager.darwinModules.home-manager
            # TODO: do this more elegantly
            {
              home-manager.users.${USER} = import ./nix/home.nix self.outPath;
            }
            (import ./nix/darwin.nix USER)
            (if includeGui then (import ./nix/gui.nix USER) else {})
            (if USER == "nathan" then (import ./nix/nathan.nix USER) else {})
            (if includeWork then (import ./nix/work.nix { inherit HOME USER; }) else {})
          ] ++ additionalModules;
        };
    in
      {
        default = generateConfig {};

        gui = generateConfig { includeGui = true; };

        n = generateConfig { USER = "nathan"; };
        nathan = generateConfig { USER = "nathan"; };

        work = generateConfig { includeWork = true; USER = "nathan"; };
      };
  };
}
