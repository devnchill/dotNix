{config,pkgs,...}:

{
  programs.neovim = {
  	enable = true;
	viAlias=true;
	vimAlias=true;
	vimdiffAlias=true;
	plugins = with pkgs.vimPlugins;[
		gruvbox-nvim
		snacks-nvim
		mini-icons
		which-key-nvim
		blink-cmp
		tmux-nvim
	];
  };
	home.packages = with pkgs;[
		lua-language-server
	];
}
