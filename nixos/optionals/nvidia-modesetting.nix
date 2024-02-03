# Enables nvidia modesetting and power management
{...}:
{
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    nvidiaSettings = true;

    # Open-source drivers
    open = false;
  };
}
