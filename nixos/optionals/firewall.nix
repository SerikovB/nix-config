# Firewall settings
{ ... }: {
  networking = {
    firewall = { enable = true; };
    nftables = { enable = true; };
  };
}
