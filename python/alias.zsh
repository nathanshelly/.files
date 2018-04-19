command -v python3 >/dev/null 2>&1 && {
  alias python2="$(which python)"
  alias python="$(which python3)"
}
