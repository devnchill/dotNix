{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
  };
  services.upower.enable = true;
  services.blueman.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  # knot dns resolver
  services.kresd.enable = true;

  # disable built-in dns
  services.resolved.enable = false;

  environment.etc."resolv.conf" = {
    mode = "0644";
    text = "nameserver ::1";
  };
}
