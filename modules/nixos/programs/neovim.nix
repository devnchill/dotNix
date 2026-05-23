{ lib, config, ... }:
let
  cfg = config.dotnix.programs.neovim;
in
{
  options.dotnix.programs.neovim.enable = lib.mkEnableOption "neovim";

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
