{ lib, config, ... }:
let
  cfg = config.dotnix.services.docker;
in
{
  options.dotnix.services.docker.enable = lib.mkEnableOption "docker";

  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;
    users.users.viena.extraGroups = [ "docker" ];
  };
}
