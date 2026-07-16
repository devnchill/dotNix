{ sharedConfig, ... }:
let
  username = "viena";
in
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
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";

    file = {
      ".config/kitty".source = sharedConfig + "/kitty";
      ".config/niri".source = sharedConfig + "/niri";
      ".config/waybar".source = sharedConfig + "/waybar";
      ".config/nvim".source = sharedConfig + "/nvim";
      ".config/fastfetch".source = sharedConfig + "/fastfetch";
    };
  };
}
