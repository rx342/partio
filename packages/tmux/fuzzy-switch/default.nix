{
  writeShellApplication,
  nushell,
}:

writeShellApplication {
  name = "fuzzy-switch";
  runtimeInputs = [
    nushell
  ];
  text = # bash
    ''
      ${./fuzzy-switch.nu}
    '';
}
