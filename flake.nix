{
  description = "Cache flake attr";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      with import nixpkgs { inherit system; }; {
        devShells.default = mkShell {
          packages = [
            nodejs-12_x
            nodePackages.npm
          ];
        };
      });
}
