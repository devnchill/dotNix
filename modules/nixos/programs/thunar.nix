{ lib, config, ... }:
let
  cfg = config.dotnix.programs.thunar;
in
{
  options.dotnix.programs.thunar.enable = lib.mkEnableOption "thunar";

  config = lib.mkIf cfg.enable {
    programs.thunar.enable = true;
  };
}
