{ pkgs, ... }:
py: {
  default = pkgs.mkShell {
    packages = with pkgs; [
      nixd
      nixfmt-rfc-style

      poetry
      py.env.default
    ];
  };
}
