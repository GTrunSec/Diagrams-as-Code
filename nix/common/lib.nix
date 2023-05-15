{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std self flops;

  callInputs =
    (flops.lib.flake.pops.default.setInitInputs ./lib/lock)
    .setSystem
    nixpkgs.system;
in {
  inherit callInputs;
  __inputs__ = callInputs.outputsForInputsCompat;
}
