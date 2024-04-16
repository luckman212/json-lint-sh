#!/usr/bin/env bash

# requires jsonlint
# https://github.com/zaach/jsonlint

[[ -e $1 ]] || exit 1

IFS=$'\t' read -r LINEREF ERR < <(
	jsonlint -cq "$1" |&
	sed -En 's/^.*line ([0-9]+), col ([0-9]+), (.*)$/\1:\2\t\3/p'
)
IFS=':' read -r LN COL <<<"$LINEREF"

if [[ -n $LINEREF ]]; then
	cat <<-EOF 1>&2
	error found in $1
	location: line $LN, column $COL
	$ERR
	EOF
	subl "$1:$LINEREF"
	exit 1
else
	echo 1>&2 "JSON is valid"
	exit 0
fi
