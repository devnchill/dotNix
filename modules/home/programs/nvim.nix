{ pkgs, ... }:
let
  lazyLoad = name: {
    plugin = pkgs.vimPlugins.${name};
    optional = true;
  };
in
{
  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withRuby = false;
    withPython3 = false;
    plugins = with pkgs.vimPlugins; [
      lz-n
      (nvim-treesitter.withPlugins (parsers: [
        parsers.bash
        parsers.bibtex
        parsers.c
        parsers.cpp
        parsers.go
        parsers.gomod
        parsers.gosum
        parsers.haskell
        parsers.hcl
        parsers.java
        parsers.javascript
        parsers.json
        parsers.latex
        parsers.lua
        parsers.make
        parsers.nix
        parsers.python
        parsers.rust
        parsers.terraform
        parsers.toml
        parsers.tsx
        parsers.typescript
        parsers.yaml
        parsers.zsh
      ]))
      nvim-treesitter-textobjects
      gruvbox-material-nvim
      which-key-nvim
      friendly-snippets
      (lazyLoad "cord-nvim")
      (lazyLoad "nvim-dap")
      (lazyLoad "nvim-dap-ui")
      (lazyLoad "snacks-nvim")
      (lazyLoad "mini-ai")
      (lazyLoad "oil-nvim")
      (lazyLoad "mini-statusline")
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
      bash-language-server
      clang-tools
      clippy
      deadnix
      docker-language-server
      google-java-format
      gopls
      haskell-language-server
      jdt-language-server
      lldb
      lua-language-server
      marksman
      neocmakelsp
      nil
      nixfmt
      ormolu
      prettier
      prettierd
      pyright
      ruff
      rust-analyzer
      rustfmt
      statix
      stylua
      tailwindcss-language-server
      typescript-language-server
      vimPlugins.vim-clang-format
      vscode-css-languageserver
      vscode-html-languageserver
      vscode-json-languageserver
      yaml-language-server
    ];
  };
}
