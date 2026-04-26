{ pkgs, ... }:
let
  lazyLoad = name: {
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
      which-key-nvim
      friendly-snippets
      (lazyLoad "cord-nvim")
      (lazyLoad "nvim-dap")
      (lazyLoad "nvim-dap-ui")
      (lazyLoad "snacks-nvim")
      (lazyLoad "mini-ai")
      (lazyLoad "grug-far-nvim")
      (lazyLoad "blink-cmp")
      (lazyLoad "mini-icons")
      (lazyLoad "mini-pairs")
      (lazyLoad "tmux-nvim")
      (lazyLoad "conform-nvim")
      (lazyLoad "gitsigns-nvim")
      (lazyLoad "bufferline-nvim")
      (lazyLoad "trouble-nvim")
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
