{
  writeShellApplication,
  nushell,
  niri,
}:

writeShellApplication {
  name = "niri-dynamic-cast";
  runtimeInputs = [
    nushell
    niri
  ];
  text = # bash
    ''
      ${./dynamic-cast.nu} "$@"
    '';
}
