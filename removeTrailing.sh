#!/bin/sh
# remove trailing whitespace and convert to spaces

# todo: maybe check for existance of the input file ..

echo remove trailing whitespace
sed -i 's/[ \t]*$//' "$1"

echo replace tabs with four spaces
sed -i 's/\t/    /g' "$1"

unix2dos "$1"
