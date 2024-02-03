# Nix settings
{ lib, config, inputs, ... }: {
  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; }))
    ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = [ "/etc/nix/path" ];
  environment.etc = lib.mapAttrs' (name: value: {
    name = "nix/path/${name}";
    value.source = value.flake;
  }) config.nix.registry;

  nix.settings = {
    flake-registry = "";
    trusted-users = [ "root" "@wheel" ];
    system-features = [ "benchmark" "big-parallel" "kvm" "nixos-test" ];
    substituters = [ "https://cache.nixos.org/" ];
    experimental-features = [ "flakes" "nix-command" "repl-flake" ];
    auto-optimise-store = lib.mkDefault true;
    warn-dirty = lib.mkDefault false;
    use-xdg-base-directories = lib.mkDefault true;
  };

  # Garbage collector settings
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "-- delete-older-than +3";
  };
}
