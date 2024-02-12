{ inputs, ... }: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/passwd.d"
      "/etc/passwords"
      "/etc/age"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
