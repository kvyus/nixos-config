{ config,pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        gaps_in = 6;
        gaps_out = 20;
        border_size = 0;
        layout = "master";
      };
      decoration = {
        rounding = 4;
      };
      animations = {
        bezier = ["myBezier, 0.05, 0.9, 0.1, 1.05"];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, slide"
          "windowsIn, 1, 7,default, slide"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default, slidefadevert"
        ];
      };
      input = {
        kb_layout = "us,ru,ua";
        kb_options = "grp:alt_shift_toggle";
      };
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];
      exec-once = [
        "kitty"
        "hyprpaper &"
        "qs --config /home/unvoid/.dotfiles/home/quickshell &"
      ];
      "$fileManager" = "nemo";
      "$terminal" = "kitty";
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod,n,exec, firefox"
        "$mainMod,w,exec, steam"
        "$mainMod,d,exec, discord"
        "$mainMod,a,exec, Telegram"
        "$mainMod,k,exec, spotify"
        "$mainMod,F,fullscreen"
        "$mainMod,o,exec, hyprshot hyprshot -m output -m DP-1" 
        "$mainMod,p,exec, hyprshot -m region"
        "$mainMod,y,exec, killall .waybar-wrapped && waybar &"

        "$mainMod, Return, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod SHIFT, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit, # dwindle"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        
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

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        "$mainMod, mouse_down,workspace, e+1"
        "$mainMod, mouse_up,workspace, e-1"
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
  programs.hyprshot = {
    enable = true;
    saveLocation = "~/Pictures/Screenshots";
  };
  services.hypridle = {
    enable = true;
    settings = {
      lisetener = [
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
  programs.hyprlock = {
    enable = true;
    settings = {
      input-field = [
        {
          monitor = "";
          size = "250, 50";
          outline_thickness = 2;
          dots_size = 0.1;
          dots_spacing = 0.3;
          outer_color = "rgba(93909155)";
          inner_color = "rgba(1f192611)";
          font_color = "rgba(eadef1FF)";
          fade_on_empty = true;
          position = "0, 20";
          halign = "center";
          valign = "center";
        } 
      ];
      label = [
        {
          monitor = "";
          text = "$LAYOUT";
          color = "rgba(eadef1FF)";
          font_size = 14;
          font_family = "JetBrains Mono Nerd Font";
          position = "-30, 30";
          halign = "right";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(eadef1FF)";
          font_size = 65;
          font_family = "JetBrains Mono Nerd Font";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "    $USER";
          color = "rgba(eadef1FF)";
          outline_thickness = 2;
          dots_size = 0.2; 
          dots_spacing = 0.2;
          dots_center = true;
          font_size = 20;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 50";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "$HOME/1.png" ];
      wallpaper = [ "DP-1,$HOME/1.png" ];
    };
  };
}
