{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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

  fonts = {
    packages = with pkgs; [
      nerd-fonts.iosevka
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Iosevka Nerd Font" ];
      };
    };
  };
}
