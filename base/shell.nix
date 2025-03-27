let
  pins = import ./npins;
  nixpkgs = import pins.nixpkgs { };
in

{
  pkgs ? nixpkgs,
}:

let
  commitHooks = pkgs.callPackage ./nix/commit-hooks.nix { };
in
pkgs.mkShell {
  name = "base-devshell";
  packages = with pkgs; [
    nixfmt-rfc-style
    nixd
    npins
  ];

  shellHook = ''
    ${commitHooks.shellHook}
  '';
}
