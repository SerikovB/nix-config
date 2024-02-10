{ inputs, ... }: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];
  environment.persistence."/nix/persistence" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
