#!/usr/bin/env sh

rootPath=$(cd -P -- "$(dirname -- "${0}")" && printf '%s\n' "$(pwd -P)")

# configurable paths
export PINIMA_HOME="${PINIMA_HOME:-$rootPath}"

# fixed paths
export PINIMA_BIN="${PINIMA_HOME}/bin"
export PINIMA_RC="${PINIMA_HOME}/pinima.sh"

# configure user path
export PATH="${PATH}:${PINIMA_BIN}"
