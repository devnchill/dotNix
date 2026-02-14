{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      gruvbox-material
      snacks-nvim
      mini-icons
      which-key-nvim
      blink-cmp
      tmux-nvim
      conform-nvim
      grug-far-nvim
      gitsigns-nvim
      cord-nvim
	  bufferline-nvim
	  trouble-nvim
    ];

    extraPackages = with pkgs; [
      # Commented them . using devshells to install them so as to not pollute user
      # LSP
      #    nil
      #    lua-language-server
      #    docker-language-server
      #    yaml-language-server
      #    gopls
      #    haskell-language-server
      #    jdt-language-server
      #    vscode-json-languageserver
      #    ruff
      #    typescript-language-server
      #    pyright
      #    rust-analyzer
      #
      #    FORMATTERS
      #    vimPlugins.vim-clang-format
      #    stylua
      #    prettierd
      #    prettier
      #    nixfmt
      #    ormolu
      #    rustfmt
      #    google-java-format
    ];

  };
}
