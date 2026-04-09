{
  pkgs,
  shellHook ? "",
}:
pkgs.mkShell {
  packages = with pkgs; [
    git
  ];

  inherit shellHook;
}
