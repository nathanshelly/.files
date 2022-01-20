{
  description = ".files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin/master";
    # set nix-darwin's nipxkgs input to the nixpkgs specified in this flake
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    # set home-manager's nipxkgs input to the nixpkgs specified in this flake
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # neovim.url = "github:neovim/neovim?dir=contrib";
    # neovim.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: investigate https://github.com/cachix/pre-commit-hooks.nix#nix-flakes-support
    # inputs.pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    # inputs.flake-utils.url = "github:numtide/flake-utils";
  };

  # read thru this - https://github.com/malob/nixpkgs/blob/master/flake.nix

  outputs = { self, darwin, home-manager, nixpkgs, ... }@inputs: {
    darwinConfigurations = let
      nixpkgsConfig = {
        config = { allowUnfree = true; };
        # TODO: understand overlays better
        overlays = self.overlays;
      };

      generateConfig =
        { additionalModules ? []
        , includeGui ? false
        , includeWork ? false
        , HOME ? builtins.getEnv "HOME"
        , USER ? builtins.getEnv "USER"
        }: darwin.lib.darwinSystem {
          # default to x86_64 versions run through rosetta
          system = "x86_64-darwin";

          modules = [
            home-manager.darwinModules.home-manager
            {
              nixpkgs = nixpkgsConfig;

              # TODO: do this more elegantly
              home-manager.users.${USER} = import ./nix/home.nix self.outPath;
            }
            (import ./nix/darwin.nix USER)
            (if includeGui then (import ./nix/gui.nix { inherit nixpkgs USER; } ) else {})
            (if USER == "nathan" then (import ./nix/nathan.nix USER) else {})
            (if includeWork then (import ./nix/work.nix { inherit HOME USER; }) else {})
          ] ++ additionalModules;
        };

      generateArmConfig =
        { additionalModules ? []
        , includeGui ? false
        , includeWork ? false
        , HOME ? builtins.getEnv "HOME"
        , USER ? builtins.getEnv "USER"
        }: darwin.lib.darwinSystem {
          # default to x86_64 versions run through rosetta
          system = "x86_64-darwin";

          modules = [
            home-manager.darwinModules.home-manager
            {
              nixpkgs = nixpkgsConfig;

              # TODO: do this more elegantly
              home-manager.users.${USER} = import ./nix/home.nix self.outPath;
            }
            (
              (import ./nix/arm.nix USER) {
                m1Ize = (
                  pkgs: config: import nixpkgs {
                    system = "aarch64-darwin";
                    overlays = config.nixpkgs.overlays;
                  }
                );
              }
            )
            (if includeGui then (import ./nix/gui.nix { inherit nixpkgs USER; }) else {})
            (if USER == "nathan" then (import ./nix/nathan.nix USER) else {})
            (if includeWork then (import ./nix/work.nix { inherit HOME USER; }) else {})
          ] ++ additionalModules;
        };
    in
      {
        default = generateConfig {};

        # currently exactly the same
        arm = generateArmConfig {
          includeGui = true;
          includeWork = true;
        };
        m1 = generateArmConfig {
          includeGui = true;
          includeWork = true;
        };

        gui = generateConfig { includeGui = true; };

        n = generateConfig { USER = "nathan"; };
        nathan = generateConfig { USER = "nathan"; };

        work = generateConfig { includeWork = true; USER = "nathan"; };
      };

    overlays = [];
    # with inputs; [
    #   (
    #     final: prev: {
    #       neovim-nightly = neovim.packages.${prev.stdenv.system}.neovim;
    #     }
    #   )
    # ];
  };
}
