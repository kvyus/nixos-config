{ pkgs, ... }:
{
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
            background-color: #282828;
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
            box-shadow: inset 0 -3px transparent;
            border: none;
            border-radius: 0;
         }

         button:hover {
            background: inherit;
            box-shadow: inset 0 -3px #fbf1c7;
         }

         #workspaces button {
            padding: 0 5px;
            background-color: transparent;
            color: #fbf1c7
         }

         #workspaces button.focused {
            background-color: #3c3836;
         }

         #workspaces button.active {
            background-color: #fb4934;
            color: #3c3836;
         }

         #workspaces button.urgent {
            background-color: #cc241d;
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
            margin: 0 4px;
            background-color: #3c3836;
            color: #d8dee9;
         }

         .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
         }

         .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
         }

         #clock {
            background-color: transparent;
            color: #fbf1c7;
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
            color: #fbf1c7;
         }

         #memory {
            background-color: transparent;
            color: #fbf1c7;
         }

         #network {
            background-color: transparent;
            color: #fbf1c7;
         }

         #network.disconnected {
            background-color: #fb4934;
         }

         #pulseaudio {
            background-color: transparent;
            color: #fbf1c7;
         }

         #pulseaudio.muted {
            background-color: #fb4934;
            color: #282828;
         }

         #wireplumber {
            background-color: transparent;
            color: #fbf1c7;
         }

         #wireplumber.muted {
            background-color: #fb4934;
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
            color: #fbf1c7;
            padding: 0 5px;
            margin: 0 5px;
            min-width: 16px;
         }
      '';
   };
}
