{ lib, config, options, pkgs, theme, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      ######################
      ## Startup commands ##
      ######################

      exec-once = [
        "dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY"
        "hyprctl setcursor ${config.gtk.cursorTheme.name} ${builtins.toString config.gtk.cursorTheme.size}"
        "waybar"
        "swayidle -w timeout 300 '${pkgs.swaylock}/bin/swaylock -f' timeout 360 'suspend-unless-render' resume '${pkgs.hyprland}/bin/hyprctl dispatch dpms on' before-sleep '${pkgs.swaylock}/bin/swaylock -f'"
      ];

      ############################
      ## Hyprland look and feel ##
      ############################

      general = {
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 5;
        cursor_inactive_timeout = 30;
        border_size = 2;
        no_cursor_warps = false;
      };

      animations.enabled = true;

      decoration = {
        rounding = 8;
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          ignore_opacity = true;
          contrast = 1.17;
          brightness = 0.8;
        };
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = true;
      };

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = false;
      };


      ##################
      ## Window rules ##
      ##################

      windowrulev2 = [
        "workspace 2, class:^(code)$"
        "workspace 3, class:^(obsidian)$"
        "workspace 7, class:^(thunar)$"
        "workspace 7, class:^(nautilus)$"
        "workspace 6, class:^(firefox)$"
        "workspace 9, class:^(Spotify)$"
        "workspace 10, class:^(discord)$"
      ];


      ##################
      ## Key bindings ##
      ##################

      bind = [
        # Screenshot keybinds
        
        # Sound keybinds
        " , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        " , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        " , XF86AudioPlay, exec, playerctl play-pause"

        # Brightness keybinds
        " , XF86MonBrightnessUp, exec, brightnessctl set 50-"
        " , XF86MonBrightnessDown, exec, brightnessctl set +50"

        # Restart waybar
        "SUPER CTRL, R, exec, killall .waybar-wrapped && waybar & disown"

        # Common keybinds
        "SUPER, RETURN, exec, kitty"
        "SUPER, B, exec, firefox"
        "SUPER, F, exec, nautilus"
        "SUPER, Q, killactive"
        "SUPER, Space, exec, launcher"
        "SUPER, P, exec, power-menu"

        # Lock keybinds
        "SUPER, Escape, exec, swaylock"
        "SUPER SHIFT, Escape, exec, swaylock & sleep 1 && systemctl suspend"

        # Window keybinds
        "SUPER, T, togglefloating"

        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        "SUPER SHIFT, h, movewindow, l"
        "SUPER SHIFT, l, movewindow, r"
        "SUPER SHIFT, k, movewindow, u"
        "SUPER SHIFT, j, movewindow, d"


        # Workspace keybinds
        "SUPER, ampersand, workspace, 1"
        "SUPER, eacute, workspace, 2"
        "SUPER, quotedbl, workspace, 3"
        "SUPER, apostrophe, workspace, 4"
        "SUPER, parenleft, workspace, 5"
        "SUPER, section, workspace, 6"
        "SUPER, egrave, workspace, 7"
        "SUPER, exclam, workspace, 8"
        "SUPER, ccedilla, workspace, 9"
        "SUPER, agrave, workspace, 10"

        "SUPER, ampersand, movetoworkspacesilent, 1"
        "SUPER, eacute, movetoworkspacesilent, 2"
        "SUPER, quotedbl, movetoworkspacesilent, 3"
        "SUPER, apostrophe, movetoworkspacesilent, 4"
        "SUPER, parenleft, movetoworkspacesilent, 5"
        "SUPER, section, movetoworkspacesilent, 6"
        "SUPER, egrave, movetoworkspacesilent, 7"
        "SUPER, exclam, movetoworkspacesilent, 8"
        "SUPER, ccedilla, movetoworkspacesilent, 9"
        "SUPER, agrave, movetoworkspacesilent, 10"
      ];


      ####################
      ## Mouse bindings ##
      ####################

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];


      #####################
      ## Keyboard layout ##
      #####################

      input = {
       kb_layout = "be";
       kb_variant = "wang";
       kb_options = "caps:escape";
       repeat_delay = 350;
       repeat_rate = 50;
       accel_profile = "adaptive";
       follow_mouse = 2;
      };


      ###################
      ## Miscellaneous ##
      ###################

      xwayland = {
        force_zero_scaling = true;
      };

      misc = {
        mouse_move_enables_dpms = false;
        force_default_wallpaper = 0; # Set to 0 to disable the anime mascot wallpapers
      };
      
      env = [
        "WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];

    };

    extraConfig = ''
      general {
        col.active_border = 0xff${theme.peach}
        col.inactive_border = 0xff${theme.base}
      }
    '';

    xwayland = { enable = true; };
    systemd = { enable = true; };
  };

  home.packages = with pkgs; [
    swayidle
    swaylock
    #swaylock
    #(pkgs.swaylock-effects.overrideAttrs (oldAttrs: {
    #  version = "1.6.4-1";
    #  src = fetchFromGitHub {
    #    owner = "mortie";
    #    repo = "swaylock-effects";
    #    rev = "20ecc6a0a5b61bb1a66cfb513bc357f74d040868";
    #    sha256 = "sha256-nYA8W7iabaepiIsxDrCkG/WIFNrVdubk/AtFhIvYJB8=";
    #  };
    #}))
    swaybg
    fnott
    #hyprpaper
    #wofi
    fuzzel
    keepmenu
    pinentry-gnome
    wev
    grim
    slurp
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    wlsunset
    pavucontrol
    pamixer
    (pkgs.writeScriptBin "suspend-unless-render" ''
      #!/bin/sh
      if pgrep -x nixos-rebuild > /dev/null || pgrep -x home-manager > /dev/null || pgrep -x kdenlive > /dev/null || pgrep -x FL64.exe > /dev/null || pgrep -x blender > /dev/null;
      then echo "Shouldn't suspend"; sleep 10; else echo "Should suspend"; systemctl suspend; fi
    '')
    (pkgs.writeScriptBin "hyprworkspace" ''
      #!/bin/sh
      # from https://github.com/taylor85345/hyprland-dotfiles/blob/master/hypr/scripts/workspace
      monitors=/tmp/hypr/monitors_temp
      hyprctl monitors > $monitors

      if [[ -z $1 ]]; then
        workspace=$(grep -B 5 "focused: no" "$monitors" | awk 'NR==1 {print $3}')
      else
        workspace=$1
      fi

      activemonitor=$(grep -B 11 "focused: yes" "$monitors" | awk 'NR==1 {print $2}')
      passivemonitor=$(grep  -B 6 "($workspace)" "$monitors" | awk 'NR==1 {print $2}')
      #activews=$(grep -A 2 "$activemonitor" "$monitors" | awk 'NR==3 {print $1}' RS='(' FS=')')
      passivews=$(grep -A 6 "Monitor $passivemonitor" "$monitors" | awk 'NR==4 {print $1}' RS='(' FS=')')

      if [[ $workspace -eq $passivews ]] && [[ $activemonitor != "$passivemonitor" ]]; then
       hyprctl dispatch workspace "$workspace" && hyprctl dispatch swapactiveworkspaces "$activemonitor" "$passivemonitor" && hyprctl dispatch workspace "$workspace"
        echo $activemonitor $passivemonitor
      else
        hyprctl dispatch moveworkspacetomonitor "$workspace $activemonitor" && hyprctl dispatch workspace "$workspace"
      fi

      exit 0

    '')
  ];
}
