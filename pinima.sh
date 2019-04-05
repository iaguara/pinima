#!/usr/bin/env sh

rootPath=$(cd -P -- "$(dirname -- "${0}")" && printf '%s\n' "$(pwd -P)")

# ids
export PINIMA_UID="${PINIMA_UID:-$(id -u)}"
export PINIMA_GID="${PINIMA_GID:-$(id -g)}"

# configurable paths
export PINIMA_HOME="${PINIMA_HOME:-$rootPath}"
_data="${PINIMA_DATA:-$IA_DATA}"
export PINIMA_DATA="${_data:-"${HOME}/workspace"}"

# fixed paths
export PINIMA_BIN="${PINIMA_HOME}/bin"
export PINIMA_RC="${PINIMA_HOME}/pinima.sh"

# configure user path
export PATH="${PATH}:${PINIMA_BIN}"

# host variables
export COLUMNS="${COLUMNS:-$(tput cols)}"
export LINES="${LINES:-$(tput lines)}"
