{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withRuby = false;
    withPython3 = false;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects
      gruvbox-material-nvim
      snacks-nvim
      mini-ai
      mini-icons
      mini-pairs
      which-key-nvim
      blink-cmp
      tmux-nvim
      conform-nvim
      grug-far-nvim
      gitsigns-nvim
      cord-nvim
      bufferline-nvim
      trouble-nvim
      nvim-dap
      nvim-dap-ui
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

      # Debuggers
      lldb
    ];
  };
}
