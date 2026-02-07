{config,pkgs,...}:

{
  imports = [
  	./packages.nix
  ];
  programs.ssh.startAgent=true;
  programs.fish.enable=true;
  programs.niri.enable = true;
  programs.xwayland.enable=true;
  programs.thunar.enable = true;
  programs.waybar.enable = true;
  programs.tmux.enable = true;
  programs.neovim = {
      enable=true;
      defaultEditor=true;
  };

}
