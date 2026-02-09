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
		conform-nvim
		grug-far-nvim
		gitsigns-nvim
	];

	extraPackages=with pkgs;[
		stylua
		lua-language-server
	];

  };
}
