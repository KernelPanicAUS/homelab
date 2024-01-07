{
  description = "homelab";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, ...} @ inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        getFromInput = inputName: pkg:
          inputs.${inputName}.legacyPackages.${system}.${pkg};
      in
        with pkgs; {
          formatter = pkgs.alejandra;
          devShells.default = mkShell {
            packages = [
              git
              jq
              yq
              python3
              ansible
              (python3.withPackages (pythonPackages:
                with pythonPackages; [
                  jinja2
                  kubernetes
                  mkdocs-material
                  netaddr
                  rich
                ]))
            ];
          };
        }
    );
}
