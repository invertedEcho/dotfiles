{ pkgs, ... }:

{
  services = {
    openssh.enable = true;
    printing.enable = true;
    gvfs.enable = true;
    usbmuxd.enable = true;

    xserver = {
      enable = true;
      displayManager.sessionPackages = [ pkgs.hyprland ];
      displayManager = {
	defaultSession = "hyprland";
	gdm = {
	  enable = true;
	  wayland = true;
	};
      };
      videoDrivers = ["nvidia"];
    };

    udev.packages = [
      pkgs.android-udev-rules
    ];
  };
}
