{ pkgs, ... }:
let
  myScripts = pkgs.stdenv.mkDerivation {
    pname = "viena-scripts";
    version = "1.0";

    src = ./bin;

    installPhase = ''
         mkdir -p $out/bin

         for f in *.sh; do
           name=$(basename "$f" .sh)
           install -Dm755 "$f" "$out/bin/$name"
         done

      patchShebangs $out/bin
    '';
  };
in
{
  home.packages = [ myScripts ];
}
