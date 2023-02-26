# valent-nix

Nix Flake for [Valent](https://github.com/andyholmes/valent).

## Usage

- Add `valent` to your Flake inputs:

```nix
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  inputs.valent.url = "github:FedericoSchonborn/valent-nix";
  inputs.valent.inputs.nixpkgs.follows = "nixpkgs";
}
```

- Add `valent.overlays.default` to your Nixpkgs configuration:

```nix
{valent, ...}: {
  nixpkgs.overlays = [
    valent.overlays.default
  ];
}
```

- Then, Valent can be used with NixOS' `programs.kdeconnect` option set:

```nix
{pkgs, ...}: {
  programs.kdeconnect = {
    enable = true;
    package = pkgs.valent;
  };
}
```

- You can also add the GNOME Shell extension to your system packages:

```nix
{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.gnome-shell-extension-valent
  ];
}
```

- Reboot your system and then you can enable the extension using the Extensions app or Home Manager's `dconf` module:

```nix
{pkgs, ...}: {
  dconf = {
    "org/gnome/shell" = {
      enabled-extensions = [
        pkgs.gnome-shell-extension-valent.extensionUuid
      ];
    };
  };
}
```
