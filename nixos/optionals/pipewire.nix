# Pipewire settings
{ ... }: {
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };
  environment.etc = {
    # Sample rate settings
    "pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
      context.properties = {
        default.clock.rate = 48000
        default.clock.quantum = 16
        default.clock.min-quantum = 16
        default.clock.max-quantum = 256
      }
    '';
    # Bluetooth settings
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text =
      "	  bluez_monitor.properties = {\n		  [\"bluez5.enable-sbc-xq\"] = true,\n		  [\"bluez5.enable-msbc\"] = true,\n		  [\"bluez5.enable-hw-volume\"] = true,\n		  [\"bluez5.headset-roles\"] = \"[ hsp_hs hsp_ag hfp_hf hfp_ag ]\"\n	  }\n  ";
  };
}
