## _module\.args

Additional arguments passed to each module in addition to ones
like ` lib `, ` config `,
and ` pkgs `, ` modulesPath `\.

This option is also available to all submodules\. Submodules do not
inherit args from their parent module, nor do they provide args to
their parent module or sibling submodules\. The sole exception to
this is the argument ` name ` which is provided by
parent modules to a submodule and contains the attribute name
the submodule is bound to, or a unique generated name if it is
not bound to an attribute\.

Some arguments are already passed by default, of which the
following *cannot* be changed with this option:

 - ` lib `: The nixpkgs library\.

 - ` config `: The results of all options after merging the values from all modules together\.

 - ` options `: The options declared in all modules\.

 - ` specialArgs `: The ` specialArgs ` argument passed to ` evalModules `\.

 - All attributes of ` specialArgs `
   
   Whereas option values can generally depend on other option values
   thanks to laziness, this does not apply to ` imports `, which
   must be computed statically before anything else\.
   
   For this reason, callers of the module system can provide ` specialArgs `
   which are available during import resolution\.
   
   For NixOS, ` specialArgs ` includes
   ` modulesPath `, which allows you to import
   extra modules from the nixpkgs package tree without having to
   somehow make the module aware of the location of the
   ` nixpkgs ` or NixOS directories\.
   
   ```
   { modulesPath, ... }: {
     imports = [
       (modulesPath + "/profiles/minimal.nix")
     ];
   }
   ```

For NixOS, the default value for this option includes at least this argument:

 - ` pkgs `: The nixpkgs package set according to
   the ` nixpkgs.pkgs ` option\.



*Type:*
lazy attribute set of raw value

*Declared by:*
 - [\<nixpkgs/lib/modules\.nix>](https://github.com/NixOS/nixpkgs/blob//lib/modules.nix)



## protonManager\.Proton-Manager-GE-Proton-Latest



Whether to enable Enable and Link Proton-Manager-GE-Proton-Latest
\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/nix/store/ifwwqvzc27qycrignr0p2arnzqliv880-source/modules/proton-ge\.nix](file:///nix/store/ifwwqvzc27qycrignr0p2arnzqliv880-source/modules/proton-ge.nix)



## protonManager\.Proton-Manager-GE-Proton10-28



Whether to enable Enable and Link Proton-Manager-GE-Proton10-28
\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/nix/store/ifwwqvzc27qycrignr0p2arnzqliv880-source/modules/proton-ge\.nix](file:///nix/store/ifwwqvzc27qycrignr0p2arnzqliv880-source/modules/proton-ge.nix)



## protonManager\.Proton-Manager-GE-Proton10-29



Whether to enable Enable and Link Proton-Manager-GE-Proton10-29
\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/nix/store/ifwwqvzc27qycrignr0p2arnzqliv880-source/modules/proton-ge\.nix](file:///nix/store/ifwwqvzc27qycrignr0p2arnzqliv880-source/modules/proton-ge.nix)



## protonManager\.Proton-Manager-GE-Proton9-27



Whether to enable Enable and Link Proton-Manager-GE-Proton9-27
\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/nix/store/ifwwqvzc27qycrignr0p2arnzqliv880-source/modules/proton-ge\.nix](file:///nix/store/ifwwqvzc27qycrignr0p2arnzqliv880-source/modules/proton-ge.nix)


