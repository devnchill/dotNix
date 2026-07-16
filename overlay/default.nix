_: prev: {
  mpv = prev.mpv.override {
    youtubeSupport = false;
  };

  spicetify-cli = prev.spicetify-cli.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [
      prev.nodejs
      prev.esbuild
    ];
    postBuild = ''
      esbuild ./src/jsHelper/spicetifyWrapper/index.js \
        --bundle --minify --target=chrome108 --format=iife \
        --outfile=spicetifyWrapper.js
    '';
    postInstall = (old.postInstall or "") + ''
      chmod -R u+w $out/share/spicetify/jsHelper
      cp spicetifyWrapper.js $out/share/spicetify/jsHelper/spicetifyWrapper.js
    '';
  });

}
