{
  description = "my project description";

  inputs.fu.url = "github:numtide/flake-utils";
  inputs.fu.inputs.nixpkgs.follows = "nixpkgs";
  inputs.nixpkgs.url = "nixpkgs/nixos-22.11";

  outputs = { self, nixpkgs, fu }: fu.lib.eachSystem fu.lib.defaultSystems (system:
    let pkgs = nixpkgs.legacyPackages.${system};
    in
    rec {
      devShells = {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [ go gopls gotools go-tools ];
        };
      };
    });
  # flake-utils.lib.eachDefaultSystem
  #   (system:
  #     let pkgs = nixpkgs.legacyPackages.${system}; in
  #     {
  #       devShells.default = import ./shell.nix { inherit pkgs; };
  #     }
  #   );
}
