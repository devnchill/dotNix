 {config,pkgs,...}:

 {
 	users.users.viena = {
 	  initialPassword="password";
 	  isNormalUser = true;
 	  extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
 	  shell=pkgs.fish;
 	};
}
