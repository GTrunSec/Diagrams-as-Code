{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    std-ext.url = "github:GTrunSec/std-ext";

    std.follows = "std-ext/std";
    flops.follows = "std-ext/flops";
    org-roam-book-template.follows = "std-ext/org-roam-book-template";
  };
  outputs = {std, ...} @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./nix;

      cellBlocks = with std.blockTypes; [
        (installables "packages")

        (functions "devshellProfiles")
        (devshells "devshells")

        (runnables "entrypoints")

        (functions "lib")
        (data "config")

        (functions "packages")

        (functions "overlays")

        (nixago "nixago")
      ];
    } {
      devShells = inputs.std.harvest inputs.self ["automation" "devshells"];
    };
}
