{
  description = "GitHub MCP Server - Go 1.24 development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go_1_24
            golangci-lint
            git
            git-lfs
          ];

          shellHook = ''
            echo "GitHub MCP Server - Go 1.24 environment loaded"
          '';
        };
      }
    );
}
