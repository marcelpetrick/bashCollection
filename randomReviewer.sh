#!/bin/bash

# author:	Marcel Petrick (mail@marcelpetrick.it)
#
# about:	randomReviewer: solves the problem that (most of the times) nobody volunteers to make a code-review. Simply picks from an array of predefined identifiers.
#
# license:	GNU General Public License v3.0

# initialize the array
# todo fix this to better style
array[0]="MSA"
array[1]="MBH"
array[2]="HGA"
array[3]="NLE"
array[4]="MLA"
array[5]="MPE"
array[6]="RNI"
array[7]="GSC"

# remove myself based on the login name
todelete=(MPE)
printf '%s\n' "${array[@]}"

for target in "${todelete[@]}"; do
  for i in "${!array[@]}"; do
    if [[ ${array[i]} = "${todelete[0]}" ]]; then
      unset 'array[i]'
    fi
  done
done

echo "--------------------------------"
printf '%s\n' "${array[@]}"

# randomly pick a reviewer
size=${#array[@]}
index=$(($RANDOM % $size))
echo "Mister ${array[$index]} is your candidate as reviewer. Congratulations!"
echo "In case you picked yourself - just rerun ;))"

# todo: externals can just select internals
# todo: exclude yourself (maybe by checking login name)
