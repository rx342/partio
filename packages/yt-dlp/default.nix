{ pkgs, ... }:

{
  wrappers.yt-dlp = {
    basePackage = pkgs.yt-dlp;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config-locations"
      "${./yt-dlp.conf}"
    ];
  };
}
