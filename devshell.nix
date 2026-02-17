{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    git
    nixfmt
    lua-language-server
    stylua
    nil
  ];
}
