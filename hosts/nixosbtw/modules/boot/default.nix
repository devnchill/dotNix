{ pkgs, ... }:
{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;

    initrd.luks.devices = {
      cryptroot = {
        device = "/dev/disk/by-uuid/d5be744f-11e5-42f8-82be-12044d5b333e";
        preLVM = true;
      };
    };

    resumeDevice = "/dev/disk/by-uuid/794d460b-42aa-45f5-ac09-2bba53a340b8";
    kernelParams = [ "resume=/dev/disk/by-uuid/794d60b042aa045f50ac09-2bba53a340b8" ];
  };
}
