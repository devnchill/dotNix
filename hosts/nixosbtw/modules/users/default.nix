 {config,pkgs,...}:

 {
 	users.users.viena = {
 	  initialPassword="password";
 	  isNormalUser = true;
 	  extraGroups = [ "wheel" "networkmanager"]; 
 	  shell=pkgs.fish;
 	};
}
