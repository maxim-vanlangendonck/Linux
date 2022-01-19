#!/bin/bash
#
# Elf-Params.sh
#

set -o nounset

#
# Variables
#

#
# Command line parsing
#
if [ ${#} -ge 11 ]; then
	for ((i=1; i<=11; i++)); do
		echo "${i}"
	done
else
	for word in "${@}"; do
		echo "${word}"
	done
fi
