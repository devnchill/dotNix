{config,pkgs,...}:

{
	virtualisation.docker = {
	  enable = true;
	};
	
	users.users.viena.extraGroups = [ "docker" ];
}
