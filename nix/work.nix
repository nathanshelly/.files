let
  HOME = "${builtins.getEnv "HOME"}";
  GOPATH = "${HOME}/work/go";
in
{
  darwin.environment.systemPath = [ "${GOPATH}/bin" ];

  goAuthHandling = {
    "url \"git@github.com:opendoor-labs\"" = {
      insteadOf = "https://github.com/opendoor-labs";
    };
  };

  home.sessionVariables = {
    AWS_PROFILE = "od-eng";
    GOPATH = "${GOPATH}";
    CURRENT_USER_EMAIL = "nathan.shelly@opendoor.com";
    OD_CURRENT_USER_EMAIL = "nathan.shelly@opendoor.com";
    VAULT_ADDR = https://vault.services.opendoor.com:8200;
  };
}
