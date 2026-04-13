{ stdenv, lib }:

stdenv.mkDerivation {
  pname = "DankMono";
  version = "1.0";

  src = ../../asset/fonts/DankMonoNerdFont;

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/opentype

    find $src -type f -name "*.otf" -exec cp {} $out/share/fonts/opentype/ \;

    runHook postInstall
  '';

  meta = with lib; {
    description = "Derivation for DankMono font";
    platforms = platforms.all;
  };
}
