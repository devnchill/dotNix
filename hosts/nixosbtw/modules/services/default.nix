{config,pkgs,...}:

{
  services.displayManager.sddm={
  	enable = true;
	wayland.enable = true;
	autoNumlock = true;
	};
  services.upower.enable = true;
}
