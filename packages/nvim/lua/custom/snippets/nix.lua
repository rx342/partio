return {
  s(
    "shell",
    fmt(
      [[
        pkgs.<type> {
          packages = with pkgs; [
            <pkgs>
          ];
        };
      ]],
      {
        type = c(1, { t("mkShell"), t("mkShellNoCC") }, {}),
        pkgs = i(2),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    "drv",
    fmt(
      [[
        <env>.mkDerivation {
            name = "<name>";
            src = <src>;
            nativeBuildInputs = [
              <nativePkgs>
            ];
            buildInputs = [
              <buildPkgs>
            ];
            buildPhase = ''
              <build>
            '';
            installPhase = ''
              <install>
            '';
        };
      ]],
      {
        env = c(1, { t("stdenv"), t("stdenvNoCC") }, {}),
        name = i(2),
        src = i(3),
        nativePkgs = i(4),
        buildPkgs = i(5),
        build = i(6),
        install = i(7),
      },
      { delimiters = "<>" }
    )
  ),
}
