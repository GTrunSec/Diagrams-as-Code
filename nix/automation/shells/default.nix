{
  inputs,
  cell,
}: let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs std;
  pythonEnv = nixpkgs.python3.withPackages (ps:
    with ps; [
      diagrams
      python-lsp-server
    ]);
in
  l.mapAttrs (_: std.lib.dev.mkShell) {
    default = {...}: {
      name = "Diagrams as Code";

      imports = [
        inputs.std-ext.automation.devshellProfiles.default
        inputs.std-ext.automation.devshellProfiles.docs
      ];

      packages = [
        nixpkgs.d2
        pythonEnv
      ];

      nixago = l.flatten [
        (inputs.std-ext.preset.nixago.treefmt cell.configs.treefmt)
        # (l.attrValues inputs.cells.ilograph.nixago)
      ];
    };

    docs = {
      name = "mkdocs";
      imports = [
        inputs.std-ext.automation.devshellProfiles.docs
      ];
    };
  }
