{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              pkgsCross.i686-embedded.buildPackages.gcc
            ];
          };
        };
    };
}
