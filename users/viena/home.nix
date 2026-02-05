{ pkgs, inputs, ... }:

let
  spicePkgs =
    inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  imports = [
  	./modules/fish
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.username = "viena";
  home.homeDirectory = "/home/viena";
  home.stateVersion = "25.11";

  home.file.".config/kitty".source = ./kitty;
  home.file.".config/niri".source = ./niri;
  home.file.".config/waybar".source = ./waybar;
  home.file.".local/bin".source = ./bin;



  home.packages = with pkgs; [
    brave
    vesktop
  ];

  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];

    theme = spicePkgs.themes.matte;
  };

  programs.git = {
      enable = true;
      settings = {
      user={
          name="Viena";
          email = "169875752+devnchill@users.noreply.github.com";
      };
      core.editor="nvim";
      init.defaultbranch="main";
      pull.rebase=false;
      };
  };

  programs.neovim = {
  	enable = true;
	extraConfig='' 
		set number relativenumber
		set tabstop=4
		set shiftwidth=4
	'';
  };
}

