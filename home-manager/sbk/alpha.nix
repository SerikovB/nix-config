# Home-manager configuration file
{
  outputs,
  pkgs,
  ...
}: {
  imports = [
    # Settings
    ./settings-alpha

    # Optionals
    ./optionals/direnv.nix
    ./optionals/firefox.nix
    ./optionals/git.nix
    ./optionals/lf.nix
    ./optionals/neovim
    ./optionals/zathura.nix
    ./optionals/zsh.nix
    ./settings-alpha/wayland.nix

    # Wayland-specific
    ./optionals/wayland/foot.nix
    ./optionals/wayland/hyprland
    # ./optionals/wayland/kitty.nix
    ./optionals/wayland/mako.nix
    ./optionals/wayland/swayidle.nix
    ./optionals/wayland/swaylock.nix
    ./optionals/wayland/waybar.nix
    ./optionals/wayland/wofi.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  home.packages = with pkgs; [
    # Programs
    bc
    bottom
    brightnessctl
    btop
    calcurse
    eza
    ffmpeg
    httpie
    jq
    mpv
    ripgrep
    unrar
    unzip
    nix-output-monitor
    nixfmt
    nvd

    # Wayland only
    grim
    imv
    mimeo
    slurp
    waypipe
    wev
    wf-recorder
    wl-clipboard
    wl-mirror
    xwayland
  ];

  nixpkgs = {
    # Overlays
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    # Nixpkgs configuration
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "sbk";
    homeDirectory = "/home/sbk";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
