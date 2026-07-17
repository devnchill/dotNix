{
  imports = [
    ../../modules/nixos
  ];

  dotnix = {
    services = {
      docker = {
        enable = true;
        users = [ "viena" ];
      };
      postgres.enable = true;
      sddm.enable = true;
    };
    programs = {
      fish.enable = true;
      neovim.enable = true;
      niri.enable = true;
      obs-studio.enable = true;
      thunar.enable = true;
      tmux.enable = true;
      waybar.enable = true;
    };
    cache.enable = true;
  };
}
