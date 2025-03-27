let
  pins = import ./npins;
in

{
  nixfmt-rfc-style,

  git-hooks ? import pins.git-hooks,
}:

git-hooks.run {
  src = ./.;
  hooks = {
    nixfmt-rfc-style = {
      enable = true;
      excludes = [
        "npins/default\\.nix$"
      ];
    };
  };

  tools = {
    inherit nixfmt-rfc-style;
  };
}
