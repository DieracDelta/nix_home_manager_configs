# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/70fec89c-be42-4b93-803a-fe0c8fb0ba88";
    fsType = "btrfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E0D3-1900";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/22a92bdb-bb04-4323-b3f2-72b73582e6df";
    fsType = "btrfs";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/8d8b8c20-2220-45a1-86ba-a30ca8200f9d"; }];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";

  # end of hw.nix; now for the rest of the settings...

  # TODO figure out why this doesn't work...
  services.udev.extraHwdb = ''
    evdev:input:b0011v0001p0001eAB41
    KEYBOARD_KEY_92=4
    KEYBOARD_KEY_93=p
    KEYBOARD_KEY_94=f
    KEYBOARD_KEY_95=x
  '';

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.prime = {
    sync.enable = true;
    # Bus ID of the NVIDIA GPU
    nvidiaBusId = "PCI:1:0:0";
    # Bus ID of the Intel GPU
    intelBusId = "PCI:0:2:0";
  };

  boot.loader.systemd-boot.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # steam shit
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;

  hardware.bluetooth.enable = true;

  hardware.cpu.intel.updateMicrocode = true;

}