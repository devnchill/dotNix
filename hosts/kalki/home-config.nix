{ spicetify-nix, sharedConfig, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.viena = ./users/viena/home.nix;
    extraSpecialArgs = {
      inherit spicetify-nix;
      inherit sharedConfig;
    };
  };
}
