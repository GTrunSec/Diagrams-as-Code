{
  inputs,
  cell,
}: let
  inherit (inputs.cells.common.lib) __inputs__;
  inherit (inputs) nixpkgs;

  l = inputs.nixpkgs.lib // builtins;
  icons = __inputs__.pyDiagrams + "/resources";
  diagrams = with inputs; "${(std.incl self ["diagrams/ilograph"])}/diagrams/ilograph";

  toJSON = file:
    nixpkgs.runCommand "toJSON.json" {preferLocalBuild = true;} ''
      ${nixpkgs.remarshal}/bin/yaml2json -i ${file} -o $out
    '';
in {
  example = {
    resources = [{
      name = "My Environmentresources";
    }];
    perspectives = [];
  };
  importSimple = l.importJSON (toJSON (diagrams + "/simple.yaml"));
}
