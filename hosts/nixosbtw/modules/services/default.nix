{ pkgs, ... }:
{
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
      theme = "sddm-astronaut-theme";
      extraPackages = with pkgs; [
        kdePackages.qtmultimedia
        kdePackages.qtsvg
        kdePackages.qtvirtualkeyboard
      ];
    };

    upower.enable = true;

    blueman.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };

    # knot dns resolver
    kresd.enable = true;

    # disable built-in dns
    resolved.enable = false;

    postgresql = {
      enable = true;
      ensureDatabases = [ "defaultdb" ];
      package = pkgs.postgresql;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
        host    all    all    127.0.0.1/32 md5
        host    all       all   ::1/128    md5
      '';
    };
  };

  environment.etc."resolv.conf" = {
    mode = "0644";
    text = ''
      nameserver ::1
      nameserver 127.0.0.1
    '';
  };
}
