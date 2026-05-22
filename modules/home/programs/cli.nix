{ pkgs, ... }:
{
  programs = {
    fzf = {
      enable = true;
    };

    zoxide = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
    };
  };

  home.packages = with pkgs; [
    lazygit
  ];
}
