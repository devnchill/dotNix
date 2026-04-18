{ pkgs, ... }:
let
  load = name: {
    plugin = pkgs.vimPlugins.${name};
    optional = true;
  };
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withRuby = false;
    withPython3 = false;
    plugins = with pkgs.vimPlugins; [
      lz-n
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects
      gruvbox-material-nvim
      snacks-nvim
      mini-ai
      which-key-nvim
      cord-nvim
      nvim-dap
      nvim-dap-ui
      (load "grug-far-nvim")
      (load "blink-cmp")
      (load "mini-icons")
      (load "mini-pairs")
      (load "tmux-nvim")
      (load "conform-nvim")
      (load "gitsigns-nvim")
      (load "bufferline-nvim")
      (load "trouble-nvim")
    ];

    extraPackages = with pkgs; [
      # LSP
      nil
      lua-language-server
      docker-language-server
      yaml-language-server
      gopls
      # haskell-language-server
      jdt-language-server
      vscode-json-languageserver
      vscode-css-languageserver
      tailwindcss-language-server
      ruff
      typescript-language-server
      pyright
      rust-analyzer

      # FORMATTERS
      vimPlugins.vim-clang-format
      stylua
      prettierd
      prettier
      nixfmt
      ormolu
      rustfmt
      google-java-format

      # Linters
      statix
      deadnix

      # Debuggers
      lldb
    ];
  };
}
