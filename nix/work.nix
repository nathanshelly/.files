let
  HOME = "${builtins.getEnv "HOME"}";
  GOPATH = "${HOME}/work/go";
in
{
  home.sessionVariables = {
    GOPATH = "${GOPATH}";
    VAULT_ADDR = https://vault.services.opendoor.com:8200;
    OD_CURRENT_USER_EMAIL = "nathan.shelly@opendoor.com";
  };
  darwin.environment.systemPath = [ "${GOPATH}/bin" ];
}
