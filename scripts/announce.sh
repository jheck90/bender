#!/usr/bin/env bash

# Usage:
#  accounce.sh jheck90/bender:0.1.72

cat <<EOF | shuf -n 1 $FILE | sed "s/VERSION/$1/g"
VERSION, shields up, weapons online. Test complete and hello from CircleCI.
EOF
