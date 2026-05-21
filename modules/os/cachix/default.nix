_:
let
  devnchillKey = "devnchill.cachix.org-1:TilbmG02gm6LclTLYflIWNxmOXKZLMf6E/Os9DxAjHc=";
in
{
  nix = {
    settings.substituters = [
      "https://devnchill.cachix.org"
      "https://cache.nixos.org"
    ];

    settings.trusted-public-keys = [
      devnchillKey
    ];
  };
}
