{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    cliphist
    unzip
    cheese
    lsof
    tor-browser
    gh
    sddm-astronaut
    baobab
    ncdu
    git-crypt
    git-lfs
    bruno
    proton-vpn
    mpv
    ripgrep
    fd
    xwayland-satellite
    jq
    brightnessctl
    swaynotificationcenter
    bibata-cursors
    pavucontrol
    fastfetch
    rofi
    awww
    file
    wget
    btop
    kitty
    curl
    fzf
    vesktop
    zathura
    (brave.override {
      commandLineArgs = [
        "--enable-features=TouchpadOverscrollHistoryNavigation --ozone-platform=wayland %U"
      ];
    })
  ];
}
