{
  writeShellApplication,
  nushell,
}:

writeShellApplication {
  name = "rofi-translate";
  runtimeInputs = [
    nushell
  ];
  text = # bash
    ''
      ${./rofi-translate.nu}
    '';
}
