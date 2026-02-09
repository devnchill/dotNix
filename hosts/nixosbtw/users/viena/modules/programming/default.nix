{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    cabal-install
    docker-compose
    gcc
    ghc
    go
    jdk
    nodejs
    typescript-go
    rustup
    llvmPackages_22.clang-unwrapped
  ];
}
