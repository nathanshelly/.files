{
  description = ".files";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";

    # neovim.url = "github:neovim/neovim?dir=contrib";
    # neovim.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: investigate https://github.com/cachix/pre-commit-hooks.nix#nix-flakes-support
    # pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  # read thru this - https://github.com/malob/nixpkgs/blob/master/flake.nix

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          devShells.default = import ./shell.nix { inherit pkgs; };
        }
      );
}
