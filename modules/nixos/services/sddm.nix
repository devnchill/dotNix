{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.dotnix.services.sddm;
in
{
  options.dotnix.services.sddm.enable = lib.mkEnableOption "SDDM";

  config = lib.mkIf cfg.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
      theme = "sddm-astronaut-theme";
      extraPackages = with pkgs; [
        kdePackages.qtmultimedia
        kdePackages.qtsvg
        kdePackages.qtvirtualkeyboard
      ];
    };
  };
}
