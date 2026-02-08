{config,pkgs,...}:

{

  programs.fzf = {
  	enable = true;
	enableFishIntegration = true;
  };

  programs.zoxide = {
	enable  = true;
	enableFishIntegration = true;
  };

  programs.direnv = {
	  enable = true;
	  nix-direnv.enable = true;
  };   

  home.packages = with pkgs;[
	lazygit
  ];
}
