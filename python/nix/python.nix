{
  pkgs,
  poetry2nix,
}:
let
  p2n = import poetry2nix { inherit pkgs; };
  python = pkgs.python313;

  targetAttrs = {
    inherit python;
    projectDir = ../.;
    overrides = p2n.overrides.withDefaults (final: prev: { });
  };

  target = { p2n }: p2n.mkPoetryApplication targetAttrs;
in
{
  packages = {
    default = pkgs.callPackage target { inherit p2n; };
  };

  env = {
    default = p2n.mkPoetryEnv (
      targetAttrs
      // {
        editablePackageSources = {
          PROJECT_NAME = ../PROJECT_NAME;
        };
      }
    );
  };
}
