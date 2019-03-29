{ version }:

{ buildfile = {
  image = "nixos/unstable";
  repositories = {
    nixpkgs = "https://nixos.org/channels/nixpkgs-unstable";
  };
  packages = [
    ("nixpkgs.haskell.compiler.ghc" + version)
    "nixpkgs.cabal-install"
    "nixpkgs.binutils"
  ];
  sources = [
    "https://github.com/fgaz/si-units.git"
  ];
  tasks = [
    {
      build = ''
        cd si-units
        cabal new-update || cabal update
        cabal new-build all
      '';
    }
  ];
};}

