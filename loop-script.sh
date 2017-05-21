#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

INTERVAL_SECONDS="30"
EXEC=(nsenter -t 1 -m -u -i -n -p --)

do_loop_script() {
  local err=0;

  "${EXEC[@]}" bash -c "${LOOP_SCRIPT}" && err=0 || err=$?
  if [[ ${err} != 0 ]]; then
    echo "!!! loop-script failed! exit code '${err}'" 1>&2
    return 1
  fi

  return 0
}

while :; do
  do_loop_script
  sleep "${INTERVAL_SECONDS}"
done
