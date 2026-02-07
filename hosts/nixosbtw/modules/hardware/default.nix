{config,pkgs,...}:

{
	imports  = [
		./hardware-configuration.nix
		./bluetooth.nix
	];
}
