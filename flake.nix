{
  description = "Manage Proton with Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeModules.proton-manager = {...}: {
      imports = [./modules];
    };

    formatter.x86_64-linux = pkgs.alejandra;

    packages.${system} =
      import ./packages/build-proton-GE-versions.nix {
        lib = pkgs.lib;
        callPackage = pkgs.callPackage;
      }
      // {
        doc = pkgs.callPackage ./lib/options-doc.nix {};
      };

    checks.${system}.default = pkgs.testers.nixosTest {
      name = "Basic Module Check";
      nodes.machine = {
        imports = [inputs.home-manager.nixosModules.home-manager];

        users.users.fake = {
          createHome = true;
          isNormalUser = true;
        };
        home-manager.sharedModules = [self.homeModules.proton-manager];
        home-manager.users.fake = {
          protonManager.Proton-Manager-GE-Proton10-29 = true;
          home.stateVersion = "25.11";
        };
      };
      testScript = ''
        # Boot:
        start_all()
        machine.wait_for_unit("multi-user.target")
        machine.wait_for_unit("nix-daemon.socket")

        # Run tests:
        machine.succeed("test -e /home/fake/.config/steamtinkerlaunch/proton/custom/Proton-Manager-GE-Proton10-29")
        machine.succeed("test -e /home/fake/.config/heroic/tools/proton/Proton-Manager-GE-Proton10-29")
        machine.succeed("test -e /home/fake/.local/share/lutris/runners/proton/Proton-Manager-GE-Proton10-29")
      '';
    };
  };
}
