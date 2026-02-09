{ pkgs, inputs, ... }:

{
  imports = [
    ./modules/spicetify
    ./modules/fish
    ./modules/cli
    ./modules/git
    ./modules/nvim
    ./modules/programming
  ];

  home.username = "viena";
  home.homeDirectory = "/home/viena";
  home.stateVersion = "25.11";

  home.file.".config/kitty".source = ./config/kitty;
  home.file.".config/niri".source = ./config/niri;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/nvim".source = ./config/nvim;
  home.file.".tmux.conf".source = ./config/tmux/.tmux.conf;
  home.file.".local/bin".source = ./bin;

}
