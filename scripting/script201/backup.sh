#!/bin/bash

#
# variables
#

Directory=
Timestamp=(date +%Y%m%d%H%M)
destination=/tmp

#
# Functions
#

usage() {
cat << _EOF_
Usage:

_EOF_
}

#
# Command line parsing
#

if [ "$#" -gt 2 ]; then

fi

while [ "$#" -gt 0 ]; do
    case "${1}" in
        -h | --help | -?)
            usage
            exit 0
            ;;
        -d|--destination)
            destination='${1}'
            if [ ! -d '${1}' ]; then
                echo "${1} doesn't exist!" <&2
                usage
                exit 2
            fi
            ;;
        *)
            Directory='${1}'
            ;;
done
#
# Script proper
#

tar -cj