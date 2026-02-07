{config,pkgs,...}:

{
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
}
