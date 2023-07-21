{
  inputs,
  cell,
}: let
  inherit (inputs) std;
  inherit (inputs.std) dmerge;
in
  with dmerge; {
    treefmt = {
      data.formatter.prettier = {
        excludes = append [
          "conf/*"
          "data/*"
        ];
      };
    };
  }
