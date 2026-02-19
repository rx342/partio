{
  system ? builtins.currentSystem,
  source ? import ../npins,
  pkgs ? import source.nixpkgs {
    overlays = [ (import ../overlays/default.nix) ];
    config = {
      allowUnfree = true;
    };
    inherit system;
  },
}:

pkgs.rx342
