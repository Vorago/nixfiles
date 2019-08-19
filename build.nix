with import <nixpkgs> {};

let
  simplePackage = builtins.readFile "/etc/nixos/bin/runorraiseidea";
in
stdenv.mkDerivation rec {
  name = "test-environment";

  buildInputs = [ simplePackage ];
}