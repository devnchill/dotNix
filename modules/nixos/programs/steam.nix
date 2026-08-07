{ lib, config, ... }:
let
  cfg = config.dotnix.programs.steam;
in
{
  options.dotnix.programs.steam.enable = lib.mkEnableOption "steam";

  config = lib.mkIf cfg.enable {
    programs.steam.enable = true;
  };
}
