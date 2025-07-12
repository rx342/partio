{ pkgs, ... }:

{
  wrappers.swaynotificationcenter = {
    basePackage = pkgs.swaynotificationcenter;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    programs.swaync = {
      prependFlags = [
        "--config"
        ./config.json
        "--style"
        ./tokyonight.css
      ];
    };
  };
}
