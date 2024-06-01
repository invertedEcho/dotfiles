{ pkgs, ... }:

{
  services = {
    openssh.enable = true;
    printing.enable = true;
    gvfs.enable = true;
    usbmuxd.enable = true;

    displayManager = {
      defaultSession = "hyprland";
      sessionPackages = [ pkgs.hyprland ];
    };

    xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
      displayManager = {
	gdm = {
	  enable = true;
	  wayland = true;
	};
      };
    };

    udev.packages = [
      pkgs.android-udev-rules
    ];
  };
}
