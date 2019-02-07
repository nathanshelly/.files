# shorter python alias
command -v python3 > /dev/null 2>&1 && {
  alias py="$(which python3)"
}
