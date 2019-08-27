#!/bin/sh
# several cleaning functionalities combined: 0. remove trailing whitespace 1. convert to spaces 2. convert to proper DOS format 3. squash whitespace

# todo: maybe check for existence of the input file ..

echo remove trailing whitespace
sed -i 's/[ \t]*$//' "$1"

echo replace tabs with four spaces
sed -i 's/\t/    /g' "$1"

echo convert to DOS line endings
unix2dos "$1"

echo merge all multiple newlines into a single one
run="$(cat "$1" | python /c/Repos/squashMultipleWhitespace.py > "$1foobar" && mv "$1foobar" "$1")"
