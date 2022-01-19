#!/bin/bash


set -o nounset

#
# Variables
#

users=$(cut -d: -f1 /etc/passwd | sort)

echo "$users"
