{
  description = "project templates that follow the canidae solutions preferences";

  outputs = { ... }: {
    templates = rec {
      base = {
        path = ./base;
        description = "plain repo, with npins and a basic shell setup";
        welcomeText = ''
          # next steps
          ## update pins
              npins upgrade && npins update
        '';
      };

      rust = {
        path = ./rust;
        description = "rust project w/ fenix + crate2nix";
        welcomeText = ''
          # next steps
          ## update pins
              npins upgrade && npins update
          ## make sure nix/rust-toolchain.nix is up to date
              fenix.fromToolchainName {
                sha256 = "...";
              }
          ## build with nix
              nix build -L -f default.nix package
        '';
      };

      default = base;
    };
  };
}
