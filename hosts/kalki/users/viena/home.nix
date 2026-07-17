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
        gpg.format = "ssh";
        commit.gpgsign = true;
        tag.gpgSign = true;
        user.signingkey = "~/.ssh/github.pub";
      };
    };
    neovim.enable = true;
    tmux.enable = true;
    spicetify.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
    direnv.enable = true;
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "Host github.com".IdentityFile = "~/.ssh/github";
      };
    };
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
