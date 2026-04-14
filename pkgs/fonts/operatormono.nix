{ stdenv, lib }:

stdenv.mkDerivation {
  pname = "OperatorMono";
  version = "1.0";

  src = ../../asset/fonts/OperatorMono;

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/opentype

    find $src -type f -name "*.otf" -exec cp {} $out/share/fonts/opentype/ \;

    runHook postInstall
  '';

  meta = with lib; {
    description = "Derivation for OperatorMono font";
    platforms = platforms.all;
  };
}
