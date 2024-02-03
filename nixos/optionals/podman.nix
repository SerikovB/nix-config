# Podman configuration
{ config, ... }:
let docker = config.virtualisation.docker.enable;
in {
  virtualisation.podman = {
    enable = true;
    dockerCompat = !docker;
    dockerSocket.enable = !docker;
    defaultNetwork.settings.dns_enabled = true;
  };
}
