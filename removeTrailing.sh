#!/bin/sh
# remove trailing whitespace and convert to spaces and convert to proper dos and squash whitespace

# todo: maybe check for existence of the input file ..

echo remove trailing whitespace
sed -i 's/[ \t]*$//' "$1"

echo replace tabs with four spaces
sed -i 's/\t/    /g' "$1"

unix2dos "$1"

echo merge all multiple newlines into a single one
run="$(cat "$1" | python /c/Repos/squashMultipleWhitespace.py > "$1foobar" && mv "$1foobar" "$1")"
