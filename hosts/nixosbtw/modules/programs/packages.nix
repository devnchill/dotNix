{config,pkgs,...}:

{
   environment.systemPackages = with pkgs; [
      jq
      brightnessctl
      swaynotificationcenter
      bibata-cursors
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
	  docker-compose
   ];

   fonts.packages = with pkgs;[
       nerd-fonts.jetbrains-mono
   ];
}
