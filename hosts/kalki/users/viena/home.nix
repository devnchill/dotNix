{ sharedConfig, pkgs, ... }:
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
    git = {
      enable = true;
      settings = {
        user = {
          name = "Viena";
          email = "169875752+devnchill@users.noreply.github.com";
        };
        core.editor = "nvim";
        init.defaultbranch = "main";
        pull.rebase = false;
        commit.gpgsign = true;
        user.signingkey = "D4C354C82D9F5746D4AD856EC6A572D41F1674CA";
        gpg.program = "${pkgs.gnupg}/bin/gpg";
      };
    };
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
