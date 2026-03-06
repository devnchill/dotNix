{ config, pkgs, ... }:

{

  programs.fzf = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = true;
  };

  home.packages = with pkgs; [
    lazygit
  ];
}
