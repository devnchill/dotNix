{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    awww
    baobab
    bibata-cursors
    brightnessctl
    bruno
    btop
    cheese
    cliphist
    cloc
    curl
    delta
    fastfetch
    fd
    file
    fzf
    gh
    git-crypt
    git-lfs
    jq
    kitty
    lsof
    man-pages
    man-pages-posix
    mpv
    ncdu
    opencode
    pavucontrol
    proton-vpn
    qbittorrent
    ripgrep
    rofi
    sddm-astronaut
    swaynotificationcenter
    tor-browser
    unzip
    vesktop
    wget
    wl-clipboard
    xwayland-satellite
    zathura
    (brave.override {
      commandLineArgs = [
        "--enable-features=TouchpadOverscrollHistoryNavigation --ozone-platform=wayland %U"
      ];
    })
  ];
}
