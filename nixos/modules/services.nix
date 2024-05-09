{ pkgs, ... }:

{
  services.openssh.enable = true;
  services.printing.enable = true;
  services.gvfs.enable = true;
  services.usbmuxd.enable = true;

  services.xserver = {
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

  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}
