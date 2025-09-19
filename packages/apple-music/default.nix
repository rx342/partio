{
  makeDesktopItem,
  writeShellApplication,
  chromium,
}:

let
  apple-music = writeShellApplication {
    name = "apple-music";
    runtimeInputs = [
      (chromium.override { enableWideVine = true; })
    ];
    text = # bash
      ''
        chromium --user-data-dir="$HOME"/.local/share/chromium-apple-music --app=https://music.apple.com/fr
      '';
  };
in
makeDesktopItem {
  name = "apple-music";
  desktopName = "Apple Music";
  exec = "${apple-music}/bin/apple-music";
  terminal = false;
  type = "Application";
}
