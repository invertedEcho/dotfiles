{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./apps.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  sound.enable = true;

  users.users.echo = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     shell = pkgs.fish;
   };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.git.enable = true;
  programs.fish.enable = true;

  services.openssh.enable = true;
  services.printing.enable = true;
  services.gvfs.enable = true;
  services.usbmuxd.enable = true;

  services.xserver = {
    displayManager = {
      gdm = {
	enable = true;
	wayland = true;
      };
    };
    # TODO: This seems wrong. It's needed so Hyprland recognizes the GPU, i think this just pulls in the nvidia driver, but it's a Xorg configuration
    videoDrivers = ["nvidia"];
  };

  networking.wireless.iwd.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11";
}
