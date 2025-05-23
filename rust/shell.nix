let
  pins = import ./npins;
  nixpkgs = import pins.nixpkgs {
    config = { };
    overlays = [ ];
  };
in

{
  pkgs ? nixpkgs,
}:

let
  crate2nix = nixpkgs.callPackage pins.crate2nix { };
  rustToolchain = pkgs.callPackage ./nix/rust-toolchain.nix { };
  commitHooks = pkgs.callPackage ./nix/commit-hooks.nix { inherit crate2nix rustToolchain; };
in
pkgs.mkShell {
  name = "rust-devshell";
  packages = with pkgs; [
    crate2nix
    nixfmt-rfc-style
    nixd
    npins

    rustToolchain.defaultToolchain
    rustToolchain.rust-analyzer
  ];

  RUST_SRC_PATH = "${rustToolchain.rust-src}/lib/rustlib/src/rust/library";

  shellHook = ''
    ${commitHooks.shellHook}
  '';
}
