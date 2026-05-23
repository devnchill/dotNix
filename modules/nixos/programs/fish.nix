{ lib, config, ... }:
let
  cfg = config.dotnix.programs.fish;
in
{
  options.dotnix.programs.fish.enable = lib.mkEnableOption "fish";

  config = lib.mkIf cfg.enable {
    programs.fish.enable = true;
  };
}
