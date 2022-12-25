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

  outputs = { self, nixpkgs, flake-utils }: {
    devShells.aarch64-darwin.devShell.aarch64-darwin = nixpkgs.mkShell
      {
        packages = [ nixpkgs.gnumake ];

        buildInputs = [ nixpkgs.ts-node ];

        shellHook = ''
          export DEBUG=1
        '';
      };

  };

  # flake-utils.lib.eachDefaultSystem
  #   (system:
  #     let pkgs = nixpkgs.legacyPackages.${system}; in
  #     {
  #       devShell.default = pkgs.mkShell {
  #         packages = [ pkgs.gnumake ];

  #         inputsFrom = [ pkgs.hello pkgs.gnutar ];

  #         shellHook = ''
  #           export DEBUG=1
  #         '';
  #       };
  #     }
  #   );
}
