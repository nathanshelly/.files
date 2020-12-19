{
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.ssh.enable
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/github";
      };
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
        identityFile = "/etc/nix/docker_rsa";
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
}
