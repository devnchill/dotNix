{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices={
   cryptroot={
    device="/dev/disk/by-uuid/d5be744f-11e5-42f8-82be-12044d5b333e";
    preLVM=true;
   };
  };
  boot.resumeDevice="/dev/disk/by-uuid/794d460b-42aa-45f5-ac09-2bba53a340b8";
  boot.kernelParams=["resume=/dev/disk/by-uuid/794d60b042aa045f50ac09-2bba53a340b8"];


  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixosbtw"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  nixpkgs.config.allowUnfree=true;

 users.users.viena = {
   initialPassword="password";
   isNormalUser = true;
   extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
 };

  hardware.bluetooth={
    enable=true;
    settings={
     General = {
      Experimental = true;
      };
     };
  };

  nix.settings.experimental-features=["nix-command" "flakes"];

   system.autoUpgrade.enable =true;
   system.autoUpgrade.allowReboot=true;

  programs.fish.enable=true;
  programs.niri.enable = true;
  programs.xwayland.enable=true;
  programs.thunar.enable = true;
  programs.waybar.enable = true;
  programs.tmux.enable = true;
  programs.neovim = {
      enable=true;
      defaultEditor=true;
  };

   environment.systemPackages = with pkgs; [
      jq
      brightnessctl
      swaynotificationcenter
      bibata-cursors
      fastfetch
      rofi
      swww
      file
      wget 
      btop
      kitty
      curl
      fzf
   ];

   fonts.packages = with pkgs;[
       nerd-fonts.jetbrains-mono
   ];

   xdg.portal={
    enable=true ;
    wlr.enable=true;
    extraPortals=[
     pkgs.xdg-desktop-portal-gtk
     pkgs.xdg-desktop-portal-wlr
    ];
    configPackages=[
     pkgs.xdg-desktop-portal-gtk
     pkgs.xdg-desktop-portal-wlr
     ];
   };

  services.upower.enable = true;
  programs.ssh.startAgent=true;
  services.gnome.gcr-ssh-agent.enable=false;

  environment.sessionVariables = {
	  NIXOS_OZONE_WL = "1";
  };

  system.stateVersion = "25.11"; 

}
