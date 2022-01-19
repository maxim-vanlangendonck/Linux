#!/bin/bash

#
# Functions
#

usage() {
cat << _EOF_
Usage: ${0} [-h|-?|--help]

Prints a passphrase as suggested by http://xkcd.com/936/ by selecting random from a file

-h, -?, --help	Prints this usage message and exits
N		The number of words
WORDS		A readable file containing a word per line
_EOF_
}

#
# Variables
#

num_words=4
dictionary=/usr/share/dict/words

#
# Command line parsing
#

if [ "$#" -gt "2" ]; then
	echo -e "\e[31mExpected at most 2 arguments, got $\e[0m#" >&2
	usage
	exit 2
fi

while [ "$#" -gt 0 ]; do
	printf 'Arg: %s\n' "${1}"
	
	case "${1}" in
		-h|--help|-?)
			usage
			exit 0
			;;
		[0-9]*)
			num_words='${1}'
			;;
		*)
			if [ ! -f '${1}' ] || [ ! -r '${1}' ]; then
				echo "${1} is not a readable file!" <&2
				usage
				exit 2
			fi
			dictionary='${1}'
			;;
	esac

	shift
done

#
# script proper
#

shuf --head-count "${num_words}" "${dictionary}" | fmt --width=2500
