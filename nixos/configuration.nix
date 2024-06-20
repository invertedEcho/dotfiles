{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/apps.nix
    ./modules/game.nix
    ./modules/services.nix
    ./modules/programs.nix
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
    hashedPassword = "$y$j9T$kSZUSuNWFeX4o6GlPHxk20$Pcc5XjIXXCYGh/B4fqRK/zLsEYpRpRsiP9p5oLiFCC2";
  };

  # TODO: document these, why are they needed and what do they do
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" ];

  networking.wireless.iwd.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11";
}
