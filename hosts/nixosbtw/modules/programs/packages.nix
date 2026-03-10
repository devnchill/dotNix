{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sddm-astronaut
    baobab
    ncdu
    git-crypt
    bruno
    wireguard-tools
    protonvpn-gui
    proton-vpn-cli
    mpv
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
    vesktop
    (brave.override {
      commandLineArgs = [
        "--enable-features=TouchpadOverscrollHistoryNavigation --ozone-platform=wayland %U"
      ];
    })
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
