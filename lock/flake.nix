{
  description = "The resources for darwing a diagram";
  inputs = {
    pyDiagrams.url = "github:mingrammer/diagrams";
    pyDiagrams.flake = false;
  };
  outputs = {self, ...} @ inputs: {
    inherit inputs;
  };
}
