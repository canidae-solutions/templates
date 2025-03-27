# templates

common templates used by canidae solutions to start new projects

## usage
in a new folder:

```shell
$ nix flake init -t github:canidae-solutions/<template name>
```

## templates

- **base**: basic template w/ devshell, npins (includes nixpkgs), direnv, commit hooks (formatting nix files w/ `nixfmt-rfc-style`) + skeleton `default.nix`
