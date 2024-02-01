# Overlays
{inputs, ...}: {
  # Add custom packages
  additions = final: _prev: import ../pkgs {pkgs = final;};

  # Modify packages
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };

  # Use pkgs.unstable for unstable packages
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
