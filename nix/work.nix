{
  home.sessionVariables = {
    GOPATH = "${HOME}/work/go";
    VAULT_ADDR = https://vault.services.opendoor.com:8200;
    OD_CURRENT_USER_EMAIL = "nathan.shelly@opendoor.com";
  };
  darwin.environment = {
    # TODO: conditionally load based on directory existence & test string
    systemPath = [ "${GOPATH}/bin" ];
  };
}
