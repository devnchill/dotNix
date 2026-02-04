{ pkgs, config, ... }:

{
  programs.fish = {
    enable = true;
    plugins = [ { name = "grc"; src = pkgs.fishPlugins.grc.src; } ];
  };

}

