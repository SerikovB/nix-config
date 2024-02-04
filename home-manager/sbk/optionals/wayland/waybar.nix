# Waybar
{ config, lib, pkgs, ... }: let
  hasHyprland = config.wayland.windowManager.hyprland.enable;
in {
  systemd.user.services.waybar = { Unit.StartLimitBurst = 30; };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd.enable = true;
    settings = {
      primary = {
        layer = "top";
        position = "top";
        margin = "5 20 0 20";
        height = 36;
        modules-left = [

        ] ++ (lib.optionals hasHyprland [
          "hyprland/workspaces"
          "hyprland/submap"
        ]);
        modules-center = (lib.optionals hasHyprland [ "hyprland/window" ]);
        modules-right = [ "tray" ]
          ++ (lib.optionals hasHyprland [ "hyprland/language" "pulseaudio" ])
          ++ [ "cpu" "memory" "battery" "clock" ];

        cpu = {
          format = "  {usage}%";
          interval = 10;
        };
        memory = {
          format = "  {}%";
          interval = 5;
        };
        battery = {
          bat = "BAT0";
          interval = 10;
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          states = {
            "warning" = 30;
            "critical" = 10;
          };
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "   0%";
          format-icons = {
            headphone = "󰋋";
            headset = "󰋎";
            portable = "";
            default = [ "" "" "" ];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
        clock = {
          interval = 5;
          format = "{:%a, %d %b %Y %H:%M}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>
          '';
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "󰇊";
            "2" = "󰇋";
            "3" = "󰇌";
            "4" = "󰇍";
            "5" = "󰇎";
            "6" = "󰇏";
          };
        };
        "hyprland/window" = {
          "max-lenght" = "25";
          "format" = "{}";
          "format-rewrite" = {
            "(.*) — LibreWolf" = " $1";
            "(.*) — Mozilla Firefox" = " $1";
            "(.*) - zsh" = "> [$1]";
          };
        };
        "hyprland/language" = {
          format = "   {}";
          format-en = "en";
          format-ru = "ru";
          format-kk = "kz";
        };
        tray = {
          icon-size = 15;
          spacing = 10;
        };
        "custom/power" = { };
      };
    };
    style = let inherit (config.colorscheme) colors;
    in ''
      * {
        font-family: ${config.fontProfiles.regular.family}, ${config.fontProfiles.monospace.family};
        font-size: 12pt;
      }
      window#waybar {
        padding: 0;
        background-color: rgba(0, 0, 0, 0);
      }
      #workspaces {
        background-color: #${colors.base00};
        border: 2px solid #${colors.base03};
        border-radius: 18px;
        padding: 0 0.5rem;
        opacity: 0.9;
        margin-right: 1rem;
      }
      #workspaces button {
        color: #${colors.base05};
      }
      #workspaces button.hidden {
        color: #${colors.base04};
      }
      #workspaces button.focused,
      #workspaces button.active {
        color: #${colors.base0A};
      }

      #tray,
      #window {
        color: #${colors.base05};
        background-color: #${colors.base00};
        border: 2px solid #${colors.base03};
        border-radius: 18px;
        padding: 0 1rem;
        opacity: 0.9;
        margin: 0 1rem;
      }

      #cpu,
      #memory,
      #battery,
      #language,
      #pulseaudio,
      #clock {
        color: #${colors.base05};
        background-color: #${colors.base00};
        padding: 0 0.5rem;
        opacity: 0.9;
      }

      #language {
        border-width: 2px 0 2px 2px;
        border-radius: 18px 0 0 18px;
        border-color: #${colors.base03};
        border-style: solid;
        padding-left: 1rem;
      }

      #pulseaudio,
      #cpu,
      #memory,
      #battery {
        border-width: 2px 0 2px 0;
        border-style: solid;
        border-color: #${colors.base03};
      }

      #clock {
        border-width: 2px 2px 2px 0;
        border-radius: 0 18px 18px 0;
        border-color: #${colors.base03};
        border-style: solid;
        padding-right: 1rem;
      }

      #battery.warning {
        color: #${colors.base0E};
      }

      #battery.critical,
      #pulseaudio.muted {
        color: #${colors.base0F};
      }
    '';
  };
}
