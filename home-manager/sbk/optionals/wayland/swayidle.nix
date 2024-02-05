# swayidle screensaver
{ pkgs, lib, config, ... }: let
  swaylock = "${config.programs.swaylock.package}/bin/swaylock";
  pgrep = "${pkgs.procps}/bin/pgrep";
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
  hyprctl = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl";
  swaymsg = "${config.wayland.windowManager.sway.package}/bin/swaymsg";

  isLocked = "${pgrep} -x ${swaylock}";
  lockTime = 10 * 60; # TODO: configurable desktop (10 min)/laptop (4 min)

  # Makes two timeouts: one for when the screen is not locked (lockTime+timeout) and one for when it is.
  afterLockTimeout = { timeout, command, resumeCommand ? null }: [
    {
      timeout = lockTime + timeout;
      inherit command resumeCommand;
    }
    {
      command = "${isLocked} && ${command}";
      inherit resumeCommand timeout;
    }
  ];
in {
  services.swayidle = {
    enable = true;
    systemdTarget = "graphical-session.target";
    timeouts =
      # Lock screen
      [{
        timeout = lockTime;
        command = "${swaylock} -i ~/Pictures/wallpapers/default.png --daemonize --grace 15";
      }] ++
      # Mute mic
      (afterLockTimeout {
        timeout = 10;
        command = "${wpctl} set-mute @DEFAULT_SOURCE@ 1";
        resumeCommand = "${wpctl} set-mute @DEFAULT_SOURCE@ 0";
      }) ++
      # Turn off displays (hyprland)
      (lib.optionals config.wayland.windowManager.hyprland.enable
        (afterLockTimeout {
          timeout = 40;
          command = "${hyprctl} dispatch dpms off";
          resumeCommand = "${hyprctl} dispatch dpms on";
        })) ++
      # Turn off displays (sway)
      (lib.optionals config.wayland.windowManager.sway.enable
        (afterLockTimeout {
          timeout = 40;
          command = "${swaymsg} 'output * dpms off'";
          resumeCommand = "${swaymsg} 'output * dpms on'";
        }));
  };
}