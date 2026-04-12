{
  lib,
  pkgs,
  ...
}: let
  git-tree-digest = pkgs.stdenv.mkDerivation {
    pname = "git-tree-digest";
    version = "0.1.0";
    dontUnpack = true;
    nativeBuildInputs = [pkgs.python3];
    installPhase = ''
      install -Dm755 ${./git-tree-digest.py} $out/bin/git-tree-digest
    '';
    meta = {
      description = "Token-efficient project tree digest for LLM context";
      platforms = lib.platforms.all;
    };
  };

  preamble = pkgs.writeShellApplication {
    name = "preamble-cmd";
    runtimeInputs =
      [git-tree-digest]
      ++ (with pkgs; [
        onefetch
        ansifilter
        coreutils
        gitMinimal
        tree
        gnused
      ]);
    text = builtins.readFile ./preamble.sh;
  };
in
  preamble
