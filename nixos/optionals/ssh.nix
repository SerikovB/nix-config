# SSH configuration
{ lib, config, outputs, ... }:
let
  inherit (config.networking) hostName;
  hosts = outputs.nixosConfigurations;
  pubKey = host: ../${host}/ssh_host_ed25519_key.pub;
  #   persistence = config.environment.persistence ? "nix/persist";
in {
  services.openssh = {
    enable = true;
    settings = {
      # Security
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      RemoveLocalBindUnlink = "yes";
      GatewayPorts = "clientspecified";
    };
    hostKeys = [{
      path = "/etc/ssh/ssh_host_ed25519_key";
      type = "ed25519";
    }];
  };

  programs.ssh = {
    # Each hosts public key
    knownHosts = builtins.mapAttrs (name: _: {
      publicKeyFile = pubKey name;
      extraHostNames = (lib.optional (name == hostName) "localhost");
    }) hosts;
  };

  security.pam.enableSSHAgentAuth = true;
}
