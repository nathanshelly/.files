{
  description = "my project description";

  inputs.fu.url = "github:numtide/flake-utils";
  inputs.fu.inputs.nixpkgs.follows = "nixpkgs";
  inputs.nixpkgs.url = "nixpkgs/nixos-22.11";

  outputs = { self, nixpkgs, fu }: fu.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    rec {
      devShell = with pkgs;
        mkShell {
          buildInputs = [
            neovim
            zsh
          ];
          RUST_LOG = "info";
          RUST_SRC_PATH = rustPlatform.rustLibSrc;
          RUST_SRC_PATH = "";
        };
    });

  # devShells = {
  #   devShell = {
  #     aarch64-darwin = pkgs.mkShell {
  #       buildInputs = with pkgs; [ go gopls gotools go-tools ];
  #     };
  #   };
  # };
  # });
  # flake-utils.lib.eachDefaultSystem
  #   (system:
  #     let pkgs = nixpkgs.legacyPackages.${system}; in
  #     {
  #       devShells.default = import ./shell.nix { inherit pkgs; };
  #     }
  #   );
}
