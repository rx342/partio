{
  stdenvNoCC,
  makeDesktopItem,
  writeShellApplication,
  ungoogled-chromium,
}:

let
  apple-music = writeShellApplication {
    name = "apple-music";
    runtimeInputs = [
      (ungoogled-chromium.override { enableWideVine = true; })
    ];
    text = # bash
      ''
        chromium --user-data-dir="$HOME"/.local/share/chromium-apple-music --app=https://beta.music.apple.com/fr
      '';
  };
  desktopItem = makeDesktopItem {
    name = "apple-music";
    desktopName = "Apple Music";
    exec = "${apple-music}/bin/apple-music";
    terminal = false;
    type = "Application";
  };
in
stdenvNoCC.mkDerivation {
  pname = "apple-music";
  version = "1.0";
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out
    cp -r ${apple-music}/* $out
    cp -r ${desktopItem}/* $out
  '';
}
