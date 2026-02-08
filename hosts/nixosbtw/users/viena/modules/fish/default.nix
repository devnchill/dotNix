{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting
      fish_vi_key_bindings
    '';

    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  	settings={
		battery.disabled=false;
		character = {
		  success_symbol = "[λ](bold green)";
		  error_symbol = "[λ](bold red)";
	  	  vimcmd_symbol = "[λ](bold purple)";
	  	  vimcmd_visual_symbol = "[λ](bold blue)";
	  	  vimcmd_replace_one_symbol = "[λ](bold yellow)";
	  	  vimcmd_replace_symbol = "[λ](bold pink)";
      };
	};
  };

  home.packages = with pkgs; [
    grc
  ];
}

