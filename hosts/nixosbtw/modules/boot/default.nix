{config,pkgs,...}:

{

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.kernelPackages = pkgs.linuxPackages_latest;
	
	boot.initrd.luks.devices={
	 cryptroot={
	  device="/dev/disk/by-uuid/d5be744f-11e5-42f8-82be-12044d5b333e";
	  preLVM=true;
	 };
	};
	boot.resumeDevice="/dev/disk/by-uuid/794d460b-42aa-45f5-ac09-2bba53a340b8";
	boot.kernelParams=["resume=/dev/disk/by-uuid/794d60b042aa045f50ac09-2bba53a340b8"];

}
