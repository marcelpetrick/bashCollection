#!/bin/bash

# author:	Marcel Petrick (mail@marcelpetrick.it)
#
# about:	randomReviewer: solves the problem that (most of the times) nobody volunteers
#			to make a code-review. Simply picks from an array of predefined identifiers.
#
# license:	GNU General Public License v3.0

# initialize the array
array=(HGA GSC NKU MPE NLE RNI MDR)

# remove myself based on the login name
loginname=$(whoami)
#echo "you are: $loginname"
# convert to uppercase
loginname=$(echo "${loginname^^}")
echo "you are: $loginname"
# put into array
todelete=($loginname)
#echo "you are: $todelete"
#printf '%s\n' "${array[@]}"

# remove everything inside todelete
for target in "${todelete[@]}"; do
  for i in "${!array[@]}"; do
    if [[ ${array[i]} = "${todelete[0]}" ]]; then
      unset 'array[i]'
    fi
  done
done

#echo "--------------------------------"
#printf '%s\n' "${array[@]}"

# randomly pick a reviewer
size=${#array[@]}
index=$(($RANDOM % $size))
echo "Mister ${array[$index]} is your candidate as reviewer. Congratulations!"

# todo: externals can just select internals
