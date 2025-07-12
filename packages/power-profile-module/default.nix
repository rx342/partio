{
  writeShellApplication,
  nushell,
  power-profiles-daemon,
}:

{
  getter = writeShellApplication {
    name = "get-power-profile-module";
    runtimeInputs = [
      nushell
      power-profiles-daemon
    ];
    text = # bash
      ''
        ${./power-profile.nu} -g
      '';
  };
  setter = writeShellApplication {
    name = "set-power-profile-module";
    runtimeInputs = [
      nushell
      power-profiles-daemon
    ];
    text = # bash
      ''
        ${./power-profile.nu} -s
      '';
  };
}
