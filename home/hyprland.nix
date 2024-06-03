# ┌─────────────────────────────────┐
# │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
# │░█░█░█░█░█▀█░█▀█░█░░░█▀█░█▀█░█▀▄░│
# │░█▀█░▀█▀░█▀▀░█▀▄░█░░░█▀█░█░█░█░█░│
# │░▀░▀░░▀░░▀░░░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀░░│
# │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
# │░░░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░░░░░│
# │░░░░░█░░░█░█░█░█░█▀▀░░█░░█░█░░░░░│
# │░░░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░░░░│
# │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
# │░░░Brent░Matthys░on░03-06-2024░░░│
# └─────────────────────────────────┘
{ inputs, config, lib, pkgs }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
          col.active_border = lib.mkForce "rgb(${config.stylix.base16Scheme.base09})";
          col.inactive_border = lib.mkForce "rgb(${config.stylix.base16Scheme.base00})";
    };
    extraConfig = ''
      monitor=,preferred,auto,auto
      # launch waybar
      exec=~/.dotfiles/.config/waybar/start_waybar.sh

      # open to ws 1
      exec-once=hyperctl dispatch workspace 1

      # ############## #
      # Input settings #
      # ############## #

      input {
          kb_layout = be 
          kb_variant = wang

          numlock_by_default = true
          follow_mouse = 2
          touchpad {
              natural_scroll = true
          }
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }


      # ###################### #
      # Look and feel settings #
      # ###################### #

      general {
          gaps_in = 5
          gaps_out = 5
          border_size = 2

          layout = dwindle

          allow_tearing = false
      }

      decoration {

          rounding = 5 
          
          blur {
              enabled = true
              size = 3
              passes = 1
          }

          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }

      animations {
          enabled = yes

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 7, default
          animation = borderangle, 1, 7, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 7, default
      }

      dwindle {
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }

      master {
          new_is_master = true
      }

      gestures {
          workspace_swipe = true
      }

      misc {
          force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
      }

      # ############# #
      #  Window rules #
      # ############# #

      # open windows at dedicated workspaces
      windowrulev2 = workspace 2, class:^(code)$
      windowrulev2 = workspace 3, class:^(obsidian)$
      windowrulev2 = workspace 7, class:^(thunar)$
      windowrulev2 = workspace 7, class:^(nautilus)$
      windowrulev2 = workspace 6, class:^(firefox)$
      windowrulev2 = workspace 9, class:^(Spotify)$
      windowrulev2 = workspace 10, class:^(discord)$
      windowrulev2 = workspace 10, class:^(vesktop)$


      # ######### #
      # Key binds #
      # ######### #

      # sound settings
      binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
      binde=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bind=, XF86AudioPlay, exec, ~/.dotfiles/.player.sh play-pause

      # calculator
      bind=, XF86Calculator, exec, gnome-calculator

      # screen shot
      bind = , Print, exec, grimblast copy area

      $mainMod = SUPER


      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      bind = $mainMod, Return, exec, kitty
      bind = $mainMod, B, exec, firefox
      bind = $mainMod, F, exec, nautilus 
      bind = $mainMod, Q, killactive, 
      bind = $mainMod, V, togglefloating, 
      bind = $mainMod, Space, exec, ~/.dotfiles/.config/rofi/launcher/launcher.sh
      bind = $mainMod, P, exec, ~/.dotfiles/.config/rofi/powermenu/powermenu.sh
      bind = $mainMod SHIFT, R, exec, hyprctl reload 

      # Move focus with mainMod + vim keys
      bind = $mainMod, h, movefocus, l
      bind = $mainMod, l, movefocus, r
      bind = $mainMod, k, movefocus, u
      bind = $mainMod, j, movefocus, d

      # Move window with mainMod + shift + vim keys
      bind = $mainMod SHIFT, h, movewindow, l
      bind = $mainMod SHIFT, l, movewindow, r
      bind = $mainMod SHIFT, k, movewindow, u
      bind = $mainMod SHIFT, j, movewindow, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, ampersand, workspace, 1
      bind = $mainMod, eacute, workspace, 2
      bind = $mainMod, quotedbl, workspace, 3
      bind = $mainMod, apostrophe, workspace, 4
      bind = $mainMod, parenleft, workspace, 5
      bind = $mainMod, section, workspace, 6
      bind = $mainMod, egrave, workspace, 7
      bind = $mainMod, exclam, workspace, 8
      bind = $mainMod, ccedilla, workspace, 9
      bind = $mainMod, agrave, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, ampersand, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, eacute, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, quotedbl, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, apostrophe, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, parenleft, movetoworkspacesilent, 5
      bind = $mainMod SHIFT, section, movetoworkspacesilent, 6
      bind = $mainMod SHIFT, egrave, movetoworkspacesilent, 7
      bind = $mainMod SHIFT, exclam, movetoworkspacesilent, 8
      bind = $mainMod SHIFT, ccedilla, movetoworkspacesilent, 9
      bind = $mainMod SHIFT, agrave, movetoworkspacesilent, 10


      # ################# #
      # Set monitor rules #
      # ################# #

      # Lid switch rules #

      # turn off display on close
      bindl=,switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable"
      # turn on display on open
      bindl=,switch:off:Lid Switch,exec,hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1"

      # set workspaces per monitor
      workspace = 1, monitor:DP-1
      workspace = 2, monitor:DP-1
      workspace = 3, monitor:DP-1
      workspace = 4, monitor:DP-1
      workspace = 5, monitor:DP-1
      workspace = 6, monitor:HDMI-A-1
      workspace = 7, monitor:HDMI-A-1
      workspace = 8, monitor:HDMI-A-1
      workspace = 9, monitor:HDMI-A-1
      workspace = 10, monitor:HDMI-A-1
    '';
  };
}
