{
  lib,
  pkgs,
  config,
  ...
}: {
  options.programs.protonManager.GE-Proton10-29 = lib.mkEnableOption ''
    Test
  '';

  config.home =
    lib.mkIf config.programs.protonManager.GE-Proton10-29
    (let
      displayName = "Proton-Manager-${version}";
      version = "GE-Proton10-29";
      GE-Proton10-29-Package = pkgs.callPackage ./proton-ge-builder.nix {
        inherit version displayName;
        hash = "sha256-ATtKLEKA+r557FVnBoW/iYrRR4Ki9G8rjlV4+2rki0I=";
      };
    in {
      file = {
        "${config.xdg.configHome}/steamtinkerlaunch/proton/custom/${displayName}" = {
          recursive = false;
          source = GE-Proton10-29-Package;
        };
        "${config.xdg.configHome}/heroic/tools/proton/${displayName}" = {
          recursive = false;
          source = GE-Proton10-29-Package;
        };
        "${config.xdg.dataHome}/lutris/runners/proton/${displayName}" = {
          recursive = false;
          source = GE-Proton10-29-Package;
        };
      };
    });
}
