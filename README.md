# templates

common templates used by canidae solutions to start new projects

## usage
in a new folder:

```shell
$ nix flake init -t github:canidae-solutions/<template name>
```

## templates

- **base**: basic template w/ devshell, [npins](https://github.com/andir/npins) (includes nixpkgs), [direnv](https://github.com/nix-community/nix-direnv), [commit hooks](https://github.com/cachix/git-hooks.nix) (formatting nix files w/ `nixfmt-rfc-style`) + skeleton `default.nix`
- **rust**: rust project w/ toolchain produced by [fenix](https://github.com/nix-community/fenix) from `rust-toolchain.toml` and build performed by [crate2nix](https://nix-community.github.io/crate2nix/)
