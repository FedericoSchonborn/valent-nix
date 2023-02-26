{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mdDoc mkEnableOption mkIf;

  cfg = config.valent;
in {
  options = {
    valent = {
      enable = mkEnableOption (mdDoc "Valent");
    };
  };

  config = mkIf cfg.enable {
    programs.kdeconnect = {
      enable = true;
      packages = pkgs.valent;
    };
  };
}
