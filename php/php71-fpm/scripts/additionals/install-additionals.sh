#!/bin/bash

set -e

DIR="${BASH_SOURCE%/*}"

if [ "$INSTALL_XDEBUG"  = "yes" ]; then
	exec "$DIR/xdebug.sh"
fi
