{ lib, config, ... }:
let
  cfg = config.dotnix.services.docker;
in
{
  options.dotnix.services.docker = {
    enable = lib.mkEnableOption "docker";

    users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [
        "viena"
        "someone"
      ];
      description = "Users to add to the docker group";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;
    users.users = builtins.listToAttrs (
      map (user: {
        name = user;
        value = {
          extraGroups = [ "docker" ];
        };
      }) cfg.users
    );
  };
}
