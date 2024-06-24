{ pkgs, ... }:

{
  services = {
    openssh.enable = true;
    printing.enable = true;
    gvfs.enable = true;
    usbmuxd.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };

    udev.packages = [ pkgs.android-udev-rules ];
  };
}
