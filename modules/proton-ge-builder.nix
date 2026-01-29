{
  lib,
  stdenvNoCC,
  fetchzip,
  writeScript,
  version,
  hash,
  displayName,
}:
stdenvNoCC.mkDerivation {
  name = displayName;
  src = fetchzip {
    url = "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${version}/${version}.tar.gz";
    inherit hash;
  };
  installPhase = ''
    cp -R $src $out
  '';
  preFixup = ''
    substituteInPlace "$out/compatibilitytool.vdf" \
      --replace-fail "${version}" "${displayName}"
  '';
  meta = {
    homepage = "https://github.com/GloriousEggroll/proton-ge-custom";
    license = lib.licenses.bsd3;
    platforms = ["x86_64-linux"];
    sourceProvenance = [lib.sourceTypes.binaryNativeCode];
  };
}
