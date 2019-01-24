#!/bin/sh
# remove trailing whitespace and convert to spaces

echo remove trailing whitespace
sed -i 's/[ \t]*$//' "$1"

echo replace tabs with four spaces
#sed -i 's/\t/    /g' {} \;
sed -i 's/\t/    /g' "$1"
#echo "$1new"
#expand "$1" | tee -a "$1new"
#mv "$1new" "$1"
