{ HOME, USER }:

let
  GOPATH = "${HOME}/work/go";
in
{
  # ref - https://daiderd.com/nix-darwin/manual/index.html#opt-environment.systemPath
  environment.systemPath = [
    "${GOPATH}/bin"
    "${HOME}/.krew/bin"
    "${HOME}/.bun/bin"
  ];

  home-manager.users.${USER} = {
    programs.git = {
      extraConfig = {
        # TODO: continue testing this
        # would prefer simply to put this in `~/.gitconfig.work` but
        # unfortunately `gazelle update-repos` is run outside the `~/work`
        # scope which means it ignores `~/.gitconfig.work`
        "url \"git@github.com:opendoor-labs\"" = {
          insteadOf = "https://github.com/opendoor-labs";
        };
      };

      includes = [
        { path = "~/.gitconfig.work"; condition = "gitdir:~/work/"; }
      ];
    };

    home.sessionVariables = {
      AWS_PROFILE = "od-eng";
      GOPATH = "${GOPATH}";
      CURRENT_USER_EMAIL = "nathan.shelly@opendoor.com";
      OD_CURRENT_USER_EMAIL = "nathan.shelly@opendoor.com";
      VAULT_ADDR = https://vault.services.opendoor.com:8200;
    };

    # TODO: definitely do this in a less hacky way
    programs.zsh.initExtra = ''
      OD_CODE_ROOT="/Users/nathan/work/go/src/github.com/opendoor-labs/code"
      OD_TOOL_SOURCE_SCRIPT="$OD_CODE_ROOT/scripts/infra/sourced_on_shell_load.sh"
      [ -f "$OD_TOOL_SOURCE_SCRIPT" ] && source "$OD_TOOL_SOURCE_SCRIPT"

      source $GOPATH/src/github.com/opendoor-labs/code/scripts/bin/ec2_script.sh
    '';
  };
}
