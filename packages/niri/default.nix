{ pkgs, ... }:

{
  wrappers.niri = {
    basePackage = pkgs.niri;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    programs.niri = {
      prependFlags = [
        "--config=${./config.kdl}"
      ];
      pathAdd = with pkgs; [
        grim
        playerctl
        slurp
        swaybg
      ];
    };
  };
}
