{ pkgs, ... }:

{
  services = {
    openssh.enable = true;
    printing.enable = true;
    gvfs.enable = true;
    usbmuxd.enable = true;

    # displayManager = {
    #   defaultSession = "plasma";
    #   sessionPackages = [ pkgs.hyprland ];
    # };

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };

    displayManager = { sddm.enable = true; };
    desktopManager = { plasma6.enable = true; };

    udev.packages = [ pkgs.android-udev-rules ];
  };
}
