{ pkgs, ... }:

{
  wrappers.mpv = {
    basePackage = pkgs.mpv.override {
      scripts = with pkgs.mpvScripts; [
        sponsorblock
        modernz
        thumbfast
      ];
    };
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config-dir=${./config}"
    ];
  };
}
