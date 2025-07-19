{
  system ? builtins.currentSystem,
  source ? import ../../npins,
  lix-module ? source.lix-module,
  lix ? source.lix,
  pkgs ? import source.nixpkgs {
    overlays = [
      (import "${lix-module}/overlay.nix" { inherit lix; })
    ];
    config = { };
    inherit system;
  },
}:

pkgs.lix
