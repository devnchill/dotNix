{ lib, config, ... }:
let
  cfg = config.dotnix.programs.niri;
in
{
  options.dotnix.programs.niri.enable = lib.mkEnableOption "niri";

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
    programs.xwayland.enable = true;
  };
}
