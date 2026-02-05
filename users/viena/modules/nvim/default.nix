{config,pkgs,...}:

{
  programs.neovim = {
  	enable = true;
	extraConfig='' 
		set number relativenumber
		set tabstop=4
		set shiftwidth=4
	'';
  };
}
