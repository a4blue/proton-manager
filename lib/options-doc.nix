{
  lib,
  runCommand,
  nixosOptionsDoc,
  ...
}: let
  # evaluate our options
  eval = lib.evalModules {
    modules = [
      ../modules
      {
        _module.check = false;
      }
    ];
    class = "homeManager";
  };
  options = builtins.removeAttrs eval ["_module"];
  # generate our docs
  optionsDoc = nixosOptionsDoc {
    inherit options;
  };
in
  # create a derivation for capturing the markdown output
  runCommand "options-doc.md" {} ''
    cat ${optionsDoc.optionsCommonMark} >> $out
  ''
