# Standard Python development environment with poetry2nix

## Usage

1. Replace all `PROJECT_NAME`, `AUTHOR`, and `EMAIL`.
2. Modify `pyproject.toml` as needed
3. Run `direnv allow`
4. Enjoy :)

## Python version and packages

Modify `nix/python.nix` to change python version. (Do not forget to change `pyproject.toml` as well!)

You can also add overrides in this file, view poetry2nix document for more detail.