final: prev:
let
  rustToolchain = final.callPackage ./rust-toolchain.nix { };
in
rec {
  rust-build =
    let
      buildRustCrateForPkgs =
        pkgs:
        pkgs.buildRustCrate.override {
          inherit (rustToolchain) rustc cargo;
        };
    in
    final.callPackage ./rust-build.nix { inherit buildRustCrateForPkgs; };

  package = rust-build.rootCrate.build;
}
