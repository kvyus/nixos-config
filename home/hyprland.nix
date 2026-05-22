{ pkgs, config, inputs, ... }:
{
   wayland.windowManager.hyprland = {
      enable = true;
      configType = "hyprlang";
      systemd.enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland; 
      settings = {
         exec-once = [
            "awww-daemon &"
         ];

         "$mainMod" = "SUPER";
         
         monitor = [
            "HDMI-A-1, 1920x1080@100, 0x0, 1"
         ];

         general = {
            gaps_in = 6;
            gaps_out = 17;
            border_size = 3;
#            "col.inactive_border" = "rgb(928374)";
#            "col.active_border" = "rgb(ebdbb2)";
            layout = "master";
         };
         
         decoration = {
            rounding = 0;
            blur = {
               enabled = false;
            };
         };

         animations = {
            enabled = true;
            bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
            animation = [
               "windows, 1, 2, myBezier"
               "windowsOut, 1, 2, default, slide"
               "windowsIn, 1, 2, default, slide"
               "border, 1, 2, default"
               "borderangle, 2, 8, default"
               "fade, 1, 2, default"
               "workspaces, 1, 2, default, slidevert"
            ];
         };

         input = {
            kb_layout = "us,ru,ua";
            kb_variant = "colemak_dh";
            kb_options = "grp:caps_toggle";
         };
         bind = [
            "$mainMod, k, exec, firefox"
            "$mainMod, w, exec, steam"
            "$mainMod, r, exec, spotify"
            "$mainMod, a, exec, AyuGram"
            "$mainMod, s, exec, vesktop"
            "$mainMod, f, exec, nemo"
            "$mainMod, q, exec, fuzzel"

            "$mainMod, Return, exec, alacritty"
            "$mainMod, y, exec, hyprshot -m output"
            "$mainMod, u, exec, hyprshot -m region"
            "$mainMod, j, exec, killall .waybar-wrapped && waybar &"

            "$mainMod, t, fullscreen"
            "$mainMod, v, togglefloating"
            "$mainMod, d, killactive"

            "$mainMod, m, movefocus, l"
            "$mainMod, i, movefocus, r"
            "$mainMod, e, movefocus, u"
            "$mainMod, n, movefocus, d"

            "$mainMod SHIFT, m, swapwindow, l"
            "$mainMod SHIFT, i, swapwindow, r"
            "$mainMod SHIFT, e, swapwindow, u"
            "$mainMod SHIFT, n, swapwindow, d"

            "$mainMod CTRL, m, resizeactive, -20 0"
            "$mainMod CTRL, i, resizeactive, 20 0"

            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
            "$mainMod SHIFT, 0, movetoworkspace, 10"

            "$mainMod SHIFT, h, exit"
         ];
         bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
         ];
         bindel = [
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
         ];
      };
   };
   services.hypridle = {
      enable = false;
      settings = {
         listener = [
            {
               timeout = 300;
               on-timeout = "hyprctl dispatch dpms off";
               on-resume = "hyprctl dispatch dpms on";
            }
            {
               timeout = 600;
               on-timeout = "hyprlock";
            }
            {
               timeout = 900;
               on-timeout = "systemctl suspend";
            }
         ];
      }; 
  };
}
