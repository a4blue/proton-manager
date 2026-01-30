{
  config,
  protonPackage,
  displayName,
  ...
}: {
  "${config.xdg.configHome}/steamtinkerlaunch/proton/custom/${displayName}" = {
    recursive = false;
    source = protonPackage;
  };
  "${config.xdg.configHome}/heroic/tools/proton/${displayName}" = {
    recursive = false;
    source = protonPackage;
  };
  "${config.xdg.dataHome}/lutris/runners/proton/${displayName}" = {
    recursive = false;
    source = protonPackage;
  };
}
