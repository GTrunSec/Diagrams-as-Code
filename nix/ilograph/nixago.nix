{
  inputs,
  cell,
}: let
  inherit (inputs) std;
in
  builtins.mapAttrs (_: std.lib.dev.mkNixago) {
    example = {
      data = cell.config.example;
      output = "diagrams/ilograph/example.yaml";
      format = "yaml";
      hook.mode = "copy";
    };
  }
