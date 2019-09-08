#! /usr/bin/env bash

# join array with given argument
#
# refs:
# - https://stackoverflow.com/questions/22124417/bash-using-ifs-to-join-an-array-into-a-string
# - https://stackoverflow.com/questions/1527049/how-can-i-join-elements-of-an-array-in-bash
# - https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables
#
# Args:
#   - {string} delimiter - delimiter to join array by
join_by() {
  local IFS="$1";
  shift;
  # `IFS` expansion due to `$*` (see third ref above)
  # save in `_joined` as return variable
  # TODO: test exporting this
  _joined="$*";
}
