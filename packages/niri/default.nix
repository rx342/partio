{ pkgs, ... }:

{
  wrappers.niri = {
    basePackage = pkgs.niri.overrideAttrs (
      final: prev: {
        postPatch = ''
          ${prev.postPatch or ""}
          substituteInPlace resources/niri.service \
            --replace-fail '/bin/niri' "/bin/niri --config ${./config.kdl}"
        '';
      }
    );
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    pathAdd = with pkgs; [
      playerctl
      swaybg
    ];
  };
}
