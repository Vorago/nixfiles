{ lib, buildPythonPackage, fetchPypi, ... }:

{
buildPythonPackage rec {
  pname = "i3-quickterm";
  version = "1.0.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "43c2c9e5e7a16b6c88ba3088a9bfc82f7db8e13378be7c78d6c14a5f8ed05afd";
  };

  doCheck = false;
}
}