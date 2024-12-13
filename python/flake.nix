{
  description = "Standard Python development environment with poetry2nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      flake-parts,
      poetry2nix,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem =
        { pkgs, ... }@pinputs:
        let
          py = import ./nix/python.nix {
            inherit pkgs poetry2nix;
          };
        in
        {
          packages = import ./nix/packages.nix pinputs py;
          devShells = import ./nix/devshells.nix pinputs py;
        };
    };
}
