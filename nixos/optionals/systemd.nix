# Systemd settings
{ ... }: {
  boot.initrd = { systemd.enable = true; };
}
