{ lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    initrd = {
      systemd.enable = true;
      availableKernelModules = [ "nvme" "xhci_pci" "sdhci_pci" ];
      kernelModules = [ ];
    };
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "btrfs";
  };

  fileSystems."/media" = {
    device = "/dev/disk/by-label/media";
    fsType = "btrfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };

  swapDevices = [{ device = "/dev/disk/by-label/SWAP"; }];

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
    nvidia.prime = {
      amdgpuBusId = "PCI:7:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
