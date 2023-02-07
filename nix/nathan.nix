USER:

{
  homebrew = {
    masApps = {
      # TODO: conditionally install for work config
      # (free) https://apps.apple.com/us/app/super-easy-timer/id1353137878
      # "Meeter" = 1510445899;

      # (paid, $5) https://apps.apple.com/us/app/super-easy-timer/id1353137878
      "Super Easy Timer" = 1353137878;

      # (in-app purchases) https://apps.apple.com/us/app/time-out-break-reminders/id402592703
      "Time Out" = 402592703;

      # (in-app purchases) https://apps.apple.com/us/app/tailscale/id1475387142
      "Tailscale" = 1475387142;
    };
  };

  home-manager.users.${USER} = {
    # https://rycee.gitlab.io/home-manager/options.html#opt-programs.ssh.enable
    programs.ssh = {
      enable = true;
      matchBlocks = {
        "*" = {
          extraOptions = {
            IdentityAgent = "~/.1password/agent.sock";
          };
        };
        # "github.com" = {
        #   identityFile = "~/.ssh/github";
        # };
        "pi" = {
          hostname = "natasha-codes.duckdns.org";
          user = "nathan";
          identityFile = "~/.ssh/pi";
        };
        "gpubox" = {
          hostname = "gpubox1.mystic.cs.iit.edu";
          user = "nshelly";
          identityFile = "~/.ssh/gpubox";
        };
        "nix-docker" = {
          user = "root";
          hostname = "127.0.0.1";
          port = 3022;
          identityFile = "~/.ssh/docker_rsa";
        };
        "i-*" = {
          # identityFile = "~/.ssh/github";
          forwardAgent = true;
          proxyCommand = "bash -c 'AWS_PROFILE=rdi-dev aws ssm start-session --target %h --document-name AWS-StartSSHSession'";
          serverAliveInterval = 60;
          serverAliveCountMax = 10;
          user = "ubuntu";
          extraOptions = {
            IdentityAgent = "~/.1password/agent.sock";
            StrictHostKeyChecking = "no";
          };
        };
      };
    };

    home.file = {
      # https://prettier.io/docs/en/configuration.html
      ".prettierrc.json".text = ''
        {
          "arrowParens": "avoid",
          "bracketSpacing": false,
          "semi": false,
          "singleQuote": true,
          "trailingComma": "all"
        }
      '';

      # refs:
      # - https://github.com/rust-lang/rustfmt
      # - https://rust-lang.github.io/rustfmt/?version=master&search=
      ".rustfmt.toml".text = ''
        # << stable >>

        edition = "2018"
        max_width = 80
        tab_spaces = 2
        use_field_init_shorthand = true

        # << unstable >>
        # fn_single_line = true
        # format_code_in_doc_comments = true
        # imports_layout = "HorizontalVertical"
        # merge_imports = true
        # normalize_comments = true
        # normalize_doc_attributes = true
        # report_fixme = "Unnumbered"
        # report_todo = "Unnumbered"
        # trailing_semicolon = false
        # where_single_line = true
        # wrap_comments = true
      '';
    };
  };
}
