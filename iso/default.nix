{
  source ? import ../npins,
}:

let
  evalModules = import "${source.nixpkgs}/nixos/lib/eval-config.nix";
  mkMachine = modules: (evalModules { inherit modules; });
in
{
  minimal = mkMachine [
    "${source.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
    ./configuration.nix
    ./tokyonight.nix
    (
      { lib, ... }:
      {
        services.getty.helpLine = lib.mkForce ''
          Ether was created at ${toString builtins.currentTime} with partio.

          Please visit https://github.com/rx342/partio.
        '';
      }
    )
  ];
}
