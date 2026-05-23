{ lib, config, ... }:
let
  cfg = config.dotnix.programs.waybar;
in
{
  options.dotnix.programs.waybar.enable = lib.mkEnableOption "waybar";

  config = lib.mkIf cfg.enable {
    programs.waybar.enable = true;
  };
}
