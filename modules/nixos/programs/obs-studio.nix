{ lib, config, ... }:
let
  cfg = config.dotnix.programs.obs-studio;
in
{
  options.dotnix.programs.obs-studio.enable = lib.mkEnableOption "obs-studio";

  config = lib.mkIf cfg.enable {
    programs.obs-studio.enable = true;
  };
}
