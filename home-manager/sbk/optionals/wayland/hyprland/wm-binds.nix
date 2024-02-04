# Window Manager binds
{ ... }: {
  wayland.windowManager.hyprland.settings = {
    bindm = [ "SUPER,mouse:272,movewindow" "SUPER,mouse:273,resizewindow" ];

    bind = [
      "SUPER,q,killactive"

      "SUPER,s,togglesplit"
      "SUPER,f,fullscreen,0"
      "SUPERSHIFT,f,fullscreen,1"
      "SUPERALT,space,togglefloating"

      "SUPER,minus,splitratio,-0.25"
      "SUPERSHIFT,minus,splitratio,-0.3333333"

      "SUPER,equal,splitratio,0.25"
      "SUPERSHIFT,equal,splitratio,0.3333333"

      "SUPER,g,togglegroup"
      "SUPER,t,lockactivegroup,toggle"
      "SUPER,apostrophe,changegroupactive,f"
      "SUPERSHIFT,apostrophe,changegroupactive,b"

      "SUPER,h,movefocus,l"
      "SUPER,j,movefocus,d"
      "SUPER,k,movefocus,u"
      "SUPER,l,movefocus,r"

      "SUPER,Left,movefocus,l"
      "SUPER,Down,movefocus,d"
      "SUPER,Up,movefocus,u"
      "SUPER,Right,movefocus,r"

      "SUPERALT,h,swapwindow,l"
      "SUPERALT,j,swapwindow,d"
      "SUPERALT,k,swapwindow,u"
      "SUPERALT,l,swapwindow,r"

      "SUPERALT,Left,swapwindow,l"
      "SUPERALT,Down,swapwindow,d"
      "SUPERALT,Up,swapwindow,u"
      "SUPERALT,Right,swapwindow,r"

      "ALT,grave,togglespecialworkspace"
      "CTRL_ALT,grave,movetoworkspacesilent,special"

      "ALT,Tab,workspace,previous"

      "ALT,1,workspace,1"
      "ALT,2,workspace,2"
      "ALT,3,workspace,3"
      "ALT,4,workspace,4"
      "ALT,5,workspace,5"
      "ALT,6,workspace,6"

      "CTRL_ALT,1,movetoworkspacesilent,1"
      "CTRL_ALT,2,movetoworkspacesilent,2"
      "CTRL_ALT,3,movetoworkspacesilent,3"
      "CTRL_ALT,4,movetoworkspacesilent,4"
      "CTRL_ALT,5,movetoworkspacesilent,5"
      "CTRL_ALT,6,movetoworkspacesilent,6"

      "CTRL_ALT,h,movewindoworgroup,l"
      "CTRL_ALT,j,movewindoworgroup,d"
      "CTRL_ALT,k,movewindoworgroup,u"
      "CTRL_ALT,l,movewindoworgroup,r"

      "CTRL_SUPER,h,focusmonitor,l"
      "CTRL_SUPER,j,focusmonitor,d"
      "CTRL_SUPER,k,focusmonitor,u"
      "CTRL_SUPER,l,focusmonitor,r"

      "CTRL_SUPER_ALT,h,focusmonitor,l"
      "CTRL_SUPER_ALT,j,focusmonitor,d"
      "CTRL_SUPER_ALT,k,focusmonitor,u"
      "CTRL_SUPER_ALT,l,focusmonitor,r"
    ];
  };
}
