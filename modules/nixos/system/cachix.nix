{ lib, config, ... }:
let
  devnchillKey = "devnchill.cachix.org-1:TilbmG02gm6LclTLYflIWNxmOXKZLMf6E/Os9DxAjHc=";
  cfg = config.dotnix.cache;
in
{
  options.dotnix.cache = {
    enable = lib.options.mkEnableOption "devnchill cache";
  };

  config = lib.mkIf cfg.enable {
    nix = {
      settings = {
        extra-substituters = [
          "https://devnchill.cachix.org?priority=30"
        ];

        trusted-public-keys = [
          devnchillKey
        ];
      };
    };
  };
}
