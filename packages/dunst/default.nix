{ pkgs, ... }:

{
  wrappers.dunst = {
    basePackage = pkgs.dunst;
    wrapperType = "shell";
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
