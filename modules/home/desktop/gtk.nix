{ pkgs, config, ... }:

{
  gtk = {
    enable = true;

    colorScheme = "dark";

    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-dark-gtk;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 16;
    };

    gtk4 = {
      inherit (config.gtk) theme;
    };
  };
}
