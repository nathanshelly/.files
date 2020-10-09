{
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.ssh.enable
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host github.com
        IdentityFile ~/.ssh/github

      Host pi
        HostName natasha-codes.duckdns.org
        User nathan
        IdentityFile ~/.ssh/pi

      Host gpubox
        HostName gpubox1.mystic.cs.iit.edu
        User nshelly
        IdentityFile ~/.ssh/gpubox
    '';
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
