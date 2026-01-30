{
  callPackage,
  lib,
  ...
}: let
  protonPackagesJSON = builtins.fromJSON (builtins.readFile ./proton-ge.json);
  protonGEDerivations =
    map (jsonObject: {
      ${jsonObject.displayName} = callPackage ./proton-ge-package-builder.nix {
        displayName = jsonObject.displayName;
        hash = jsonObject.hash;
        version = jsonObject.version;
      };
    })
    protonPackagesJSON;
in
  builtins.foldl' (acc: elem: lib.recursiveUpdate elem acc) {} protonGEDerivations
