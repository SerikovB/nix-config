# System configuration file
{ inputs, outputs, pkgs, ... }: {
  # HostName
  networking.hostName = "alpha";

  imports = [
    # Modules
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-laptop-ssd

    # Hardware configuration
    ./hardware-configuration.nix
    ./bus-id.nix

    # Users
    ../users/sbk.nix

    # Options
    ../optionals/bluetooth.nix
    ../optionals/firewall.nix
    ../optionals/flatpak.nix
    ../optionals/fonts.nix
    ../optionals/gamemode.nix
    ../optionals/greetd.nix
    ../optionals/locale.nix
    ../optionals/network-manager.nix
    ../optionals/nix.nix
    ../optionals/nvidia-modesetting.nix
    ../optionals/opengl.nix
    ../optionals/persist.nix
    ../optionals/pipewire.nix
    ../optionals/podman.nix
    ../optionals/ssh.nix
    ../optionals/systemd-boot.nix
    ../optionals/tlp.nix
    ../optionals/xdg.nix
    ../optionals/xserver.nix
    ../optionals/zen-kernel.nix
    ../optionals/zsh.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  nixpkgs = {
    # Overlays
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    # Nixpkgs config
    config = { allowUnfree = true; };
  };

  # Enable some programs
  programs = {
    git.enable = true;
    adb.enable = true;
    dconf.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam = {
      services.swaylock = {
        text = ''
          auth include login
        '';
      };
    };
  };

  system.stateVersion = "23.11";
}
