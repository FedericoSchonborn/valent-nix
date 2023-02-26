{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachSystem ["x86_64-linux" "aarch64-linux"] (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages = {
        valent = pkgs.callPackage ./packages/valent {};
        gnome-shell-extension-valent = pkgs.callPackage ./packages/gnome-shell-extension-valent {};
      };

      formatter = pkgs.alejandra;
    })
    // {
      overlays = {
        valent = _: prev: {
          valent = self.packages.${prev.system}.valent;
          gnome-shell-extension-valent = self.packages.${prev.system}.gnome-shell-extension-valent;
        };

        default = self.overlays.valent;
      };
    };
}
