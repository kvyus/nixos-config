{ pkgs, ... }:
{
   stylix.targets.waybar.enable = false;
   programs.waybar = {
      enable = true;

      settings = {
         mainBar = {
            height = 30;
            spacing = 6;

            modules-left = [
               "hyprland/workspaces"
               "pulseaudio"
            ];

            modules-center = [
               "clock"
            ];

            modules-right = [
               "network"
               "cpu"
            ];

            "clock" = {
               tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
               format-alt = "{:%Y-%m-%d}";
            };

            "cpu" = {
               format = "{usage}%  ";
               tooltip = false;
            };

            "memory" = {
               format = "{}%  ";
            };
            "network" = {
               format-wifi = "{essid} {icon}";
               format-icons = [
                  "󰤯 "
                  "󰤟 "
                  "󰤢 "
                  "󰤥 "
                  "󰤨 "
               ];
               format-disconnected = "Disconnected 󰤭 ";
            };

            "pulseaudio" = {
               format = "{volume}% 󰋋 ";
               format-muted = " {format_source}";
               format-source = "{volume}% ";
               format-source-muted = "";
            };
         };
      };
      style = ''
         * {
            /* `otf-font-awesome` is required to be installed for icons */
            font-family: JetBrains Mono Nerd Font;
            font-size: 13px;
         }

         window#waybar {
            background-color: #111111;
            transition-property: background-color;
            transition-duration: .5s;
         }

         window#waybar.hidden {
            opacity: 0.2;
         }


         window#waybar.termite {
            background-color: #3F3F3F;
         }

         window#waybar.chromium {
            background-color: #000000;
            border: none;
         }

         button {
            border: none;
            border-radius: 0;
         }

         button:hover {
            background: inherit;
         }

         #workspaces button {
            background-color: transparent;
            color: #f5f5f5;
            padding: 0 4px;
         }

         #workspaces button.focused {
            background-color: #b21109;
         }

         #workspaces button.active {
            background-color: #b21109;
            color: #f5f5f5;
         }

         #clock,
         #battery,
         #cpu,
         #memory,
         #disk,
         #temperature,
         #backlight,
         #network,
         #pulseaudio,
         #wireplumber,
         #custom-media,
         #tray,
         #mode,
         #idle_inhibitor,

         #window {
            background-color: transparent
         }
         
         #workspaces {
            background-color: transparent;
            color: #f5f5f5;
         }

         .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
         }

         .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
         }

         #clock {
            background-color: transparent;
            color: #f5f5f5;
         }

         @keyframes blink {
            to {
               background-color: #ffffff;
               color: #000000;
            }
         }

         label:focus {
            background-color: #000000;
         }

         #cpu {
            background-color: transparent;
            color: #f5f5f5;
         }

         #memory {
            background-color: transparent;
            color: #f5f5f5;
         }

         #network {
            background-color: transparent;
            color: #f5f5f5;
         }

         #network.disconnected {
            background-color: #c75a5a;
         }

         #pulseaudio {
            background-color: transparent;
            color: #f5f5f5;
         }

         #pulseaudio.muted {
            background-color: #b21109;
            color: #111111;
         }

         #wireplumber {
            background-color: transparent;
            color: #f5f5f5;
         }

         #wireplumber.muted {
            background-color: #b21109;
         }

         #tray {
            background-color: transparent;
         }

         #tray > .passive {
            -gtk-icon-effect: dim;
         }

         #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            background-color: #eb4d4b;
         }

         #language {
            background: transparent;
            color: #f5f5f5;
            padding: 0 5px;
            margin: 0 5px;
            min-width: 16px;
         }
      '';
   };
}
