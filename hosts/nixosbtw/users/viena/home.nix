{ ... }:
{
  imports = [
    ./modules/cli
    ./modules/gtk
    ./modules/git
    ./modules/nvim
    ./modules/fish
    ./modules/tmux
    ./modules/scripts
    ./modules/spicetify
    ./modules/programming
  ];

  home = {
    username = "viena";
    homeDirectory = "/home/viena";
    stateVersion = "25.11";

    file = {
      ".config/kitty".source = ./config/kitty;
      ".config/niri".source = ./config/niri;
      ".config/waybar".source = ./config/waybar;
      ".config/nvim".source = ./config/nvim;
      ".config/fastfetch".source = ./config/fastfetch;
    };
  };
}
