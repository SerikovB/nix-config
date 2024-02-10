# Enable bluetooth
{ ... }: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  environment.persistence."/nix/persistence".directories = [
    "/var/lib/bluetooth"
  ];
}
