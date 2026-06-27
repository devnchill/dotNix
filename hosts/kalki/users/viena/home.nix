{ ... }:
{
  imports = [
    ../../../../modules/home
  ];

  programs = {
    fish.enable = true;
    starship.enable = true;
    git.enable = true;
    neovim.enable = true;
    tmux.enable = true;
    spicetify.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
    direnv.enable = true;
  };

  home = {
    username = "viena";
    homeDirectory = "/home/viena";
    stateVersion = "25.11";

    file = {
      ".config/kitty".source = ../../../../config/kitty;
      ".config/niri".source = ../../../../config/niri;
      ".config/waybar".source = ../../../../config/waybar;
      ".config/nvim".source = ../../../../config/nvim;
      ".config/lazygit".source = ../../../../config/lazygit;
      ".config/fastfetch".source = ../../../../config/fastfetch;
    };
  };
}
