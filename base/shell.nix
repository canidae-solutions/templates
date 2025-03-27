let
  pins = import ./npins;
  nixpkgs = import pins.nixpkgs { };
in

{
  pkgs ? nixpkgs
}:

pkgs.mkShell {
  name = "base-devshell";
  packages = with pkgs; [
    nixfmt-rfc-style
    nixd
    npins
  ];
}
