{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    kernelModules = [ "kvm-amd" ];
    supportedFilesystems = [ "ntfs" ];
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/16ffa14e-4ca3-44c8-b1c3-b086a5ec27f1";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/FA09-CCA4";
      fsType = "vfat";
    };

  networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # TODO: If wlan0 interface is present but can't be brought up?, this will disrupt startup as systemd tries to start the service
  # created by nixos. Fix this by allowing the service to silently faily or in a more nixos like way
  # networking.interfaces.wlan0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    pulseaudio.enable = true;

    nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

    nvidia = {
       modesetting.enable = true;
       open = false;
    };
  };
}
