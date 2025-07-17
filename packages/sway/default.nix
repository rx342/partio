{ pkgs, ... }:

{
  wrappers.sway = {
    basePackage = pkgs.sway;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    programs.sway = {
      prependFlags = [
        "--config=${./base.conf}"
      ];
      pathAdd = with pkgs; [
        grim
        playerctl
        slurp
        swaybg
      ];
    };
  };

  wrappers.swayfx = {
    basePackage = pkgs.swayfx;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    programs.sway = {
      prependFlags = [
        "--config=${pkgs.writeText "config" ''
          ${builtins.readFile ./base.conf}
          ${builtins.readFile ./fx.conf}
        ''}"
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
