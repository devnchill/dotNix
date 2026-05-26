{ lib, config, ... }:
let
  cfg = config.dotnix.programs.tmux;
in
{
  options.dotnix.programs.tmux.enable = lib.mkEnableOption "tmux";

  config = lib.mkIf cfg.enable {
    programs.tmux.enable = true;
  };
}
