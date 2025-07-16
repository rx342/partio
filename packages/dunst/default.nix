{ pkgs, ... }:

{
  wrappers.dunst = {
    basePackage = pkgs.dunst;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    programs.dunst = {
      prependFlags = [
        "-config"
        "${./dunstrc.ini}"
      ];
    };
  };
}
