{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs.buildPackages; [ 
      openjdk
      maven  # If you're using Maven
      gradle 
      python312Packages.flask
      python312Packages.psycopg2 nodejs python312Packages.argon2-cffi ];
}
