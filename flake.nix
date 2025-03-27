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

      default = base;
    };
  };
}
