{ pkgs, inputs, ... }:

{
  imports = [
  	./modules/spicetify
  	./modules/fish
  	./modules/git
  	./modules/nvim
  ];

  home.username = "viena";
  home.homeDirectory = "/home/viena";
  home.stateVersion = "25.11";

  home.file.".config/kitty".source = ./config/kitty;
  home.file.".config/niri".source = ./config/niri;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/nvim".source = ./config/nvim;
  home.file.".tmux.conf".source = ./config/tmux/.tmux.conf;
  home.file.".local/bin".source = ./bin;

  programs.neovim = {
  	enable = true;
	extraConfig='' 
		set number relativenumber
		set tabstop=4
		set shiftwidth=4
	'';
  };
}

