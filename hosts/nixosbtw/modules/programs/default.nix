_: {
  imports = [
    ./packages.nix
  ];
  programs = {
    fish.enable = true;
    niri.enable = true;
    xwayland.enable = true;
    thunar.enable = true;
    waybar.enable = true;
    tmux.enable = true;
    obs-studio.enable = true;
    gnupg = {
      agent.enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
