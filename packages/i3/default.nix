{ pkgs, ... }:

{
  wrappers.i3 = {
    basePackage = pkgs.i3;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    programs.i3 = {
      prependFlags = [
        "--config=${./ubuntu.conf}"
      ];
      pathAdd = with pkgs; [
        maim
        numlockx
        playerctl
      ];
    };
  };
}
