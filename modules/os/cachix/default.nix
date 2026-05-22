_:
let
  devnchillKey = "devnchill.cachix.org-1:TilbmG02gm6LclTLYflIWNxmOXKZLMf6E/Os9DxAjHc=";
in
{
  config = {
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
