#!/bin/sh
# show open TODOs in the last commit

# echo case insensitive grep
echo "######## $1 ########"
grep -in "todo" "$1"
