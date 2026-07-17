{
  pkgs,
  shellHook ? "",
}:
pkgs.mkShell {
  packages = with pkgs; [
    git
    age
    sops
  ];

  inherit shellHook;
}
