{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ripgrep
    fd
    xwayland-satellite
    jq
    brightnessctl
    swaynotificationcenter
    bibata-cursors
    whitesur-icon-theme
    pavucontrol
    fastfetch
    rofi
    swww
    file
    wget
    btop
    kitty
    curl
    fzf
    brave
    vesktop
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
