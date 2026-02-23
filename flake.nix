{
  description = "partio";

  outputs =
    { self, ... }:
    let
      system = "x86_64-linux";
      partio = import ./default.nix { inherit system; };
    in
    {
      packages.${system} = {
        inherit (partio) partio;
        default = self.packages.${system}.partio;
      };

      inherit (partio) overlays;
    };
}
