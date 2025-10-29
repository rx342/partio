{
  writeShellApplication,
  nushell,
  niri,
  jq,
}:

writeShellApplication {
  name = "niri-dynamic-cast";
  runtimeInputs = [
    nushell
    jq
    niri
  ];
  text = # bash
    ''
      ${./dynamic-cast.nu} "$@"
    '';
}
