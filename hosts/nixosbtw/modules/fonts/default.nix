{ pkgs, ... }:

{
  fonts = {
    packages = [
      (pkgs.callPackage ../../../../pkgs/fonts/dankmono.nix { })
      (pkgs.callPackage ../../../../pkgs/fonts/operatormono.nix { })
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        monospace = [ "DankMono Nerd Font Mono" ];
        sansSerif = [ "DankMono Nerd Font" ];
        serif = [ "DankMono Nerd Font" ];
      };
    };
  };
}
