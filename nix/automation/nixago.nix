{
  inputs,
  cell,
}: let
  inherit (inputs) std;
in {
  treefmt = std.presets.nixago.treefmt {
    data.formatter.nix = {
      excludes = [
        "generated.nix"
      ];
    };
    data.formatter.prettier = {
      excludes = [
        "conf/*"
        "data/*"
      ];
    };
  };
}
