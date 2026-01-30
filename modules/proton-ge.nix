{
  lib,
  config,
  outputs,
  system,
  pkgs,
  ...
}: let
  protonGEPackages = import ../packages/build-proton-GE-versions.nix {
    inherit lib;
    callPackage = pkgs.callPackage;
  };
in
  lib.foldlAttrs (acc: name: value:
    lib.recursiveUpdate acc {
      options.protonManager.${name} = lib.mkEnableOption ''
        Enable and Link ${name}
      '';
      config.home.file = import ../lib/proton-linker.nix {
        inherit config;
        protonPackage = value;
        displayName = name;
      };
    }) {}
  protonGEPackages
