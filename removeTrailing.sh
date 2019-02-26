#!/bin/sh
# remove trailing whitespace and convert to spaces

# todo: maybe check for existance of the input file ..

echo remove trailing whitespace
sed -i 's/[ \t]*$//' "$1"

echo replace tabs with four spaces
sed -i 's/\t/    /g' "$1"

unix2dos "$1"

# merge all double newlines into a single one
# works, but results in added newlines at the endOfFile
#awk 'BEGIN{RS="\n\n\n" ; ORS="\n\n";}{ print }' "$1" > "$1foobar"
#mv "$1foobar" "$1"

# todo new comment
run="$(cat "$1" | python /c/Repos/squashMultipleWhitespace.py > "$1foobar" && mv "$1foobar" "$1")"
