{
  description = "partio";

  outputs =
    { self, ... }:
    let
      system = "x86_64-linux";
    in
    {
      packages.${system} = {
        partio = import ./partio.nix { inherit system; };
        default = self.packages.${system}.partio;
      };
    };
}
