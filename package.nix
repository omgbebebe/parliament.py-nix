{ lib
, pkgs
, buildPythonPackage
, fetchFromGitHub
, setuptools
, python
}:

buildPythonPackage rec {
  pname = "neomodel";
  version = "git";

  src = fetchFromGitHub {
    owner = "boson-project";
    repo = "parliament";
    rev = "24a2d9c24c67296c333009f5bbea71b0a78a4dd8";
    sha256 = "sha256-+jQZwoEkuqRaeS4DtDBzn3dK+BcMmkXegV6H3jJME/o=";
  };

  build-system = [ setuptools ];
  pyproject = true;
  patches = [
  ];

  dependencies = with python.pkgs; [
    cloudevents
    deprecation
    flask
    waitress
  ];

  pythonImportsCheck = [
    "parliament"
  ];
}
