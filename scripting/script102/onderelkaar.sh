#!/bin/bash
#
# onderelkaar.sh
#
#

set -o nounset # abort on unbound variable

#
# Variables
#

#
# Command line parsing
#
for arg in "${@}"; do
	echo "${arg}"
done

if [ -z "${1}" ]; then
	echo "Geen argumenten opgegeven!" >&2
	exit 1
fi
