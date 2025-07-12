{
  writeShellApplication,
  nushell,
  spotify-cli-linux,
}:

writeShellApplication {
  name = "spotify-module";
  runtimeInputs = [
    nushell
    spotify-cli-linux
  ];
  text = # bash
    ''
      ${./position.nu}
    '';
}
