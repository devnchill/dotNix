{ lib, config, ... }:
let
  cfg = config.dotnix.programs.gnupg;
in
{
  options.dotnix.programs.gnupg.enable = lib.mkEnableOption "gnupg";

  config = lib.mkIf cfg.enable {
    programs.gnupg.agent.enable = true;
  };
}
