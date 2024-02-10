# NetworkManager settings
{ ... }: {
  networking.networkmanager = { enable = true; };

  environment.persistence."/nix/persistence".directories = [
    "/etc/NetworkManager/system-connections"
  ];
}
