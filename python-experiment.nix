let
  i3-quickterm = with pkgs.python35Packages; buildPythonApplication rec {

    name = pname + "-" + version;
    pname = "i3-quickterm";
    version = "1.0.0";

    doCheck = false;

    src = ./bin/i3-quickterm.py;

    propagatedBuildInputs =  [ i3ipc ];
  };
in
{}