#!/bin/bash
array[0]="MSA"
array[1]="MBH"
array[2]="HGA"
array[3]="NLE"
array[4]="MLA"
array[5]="MPE"
array[5]="RNI"
array[5]="GSC"

size=${#array[@]}
index=$(($RANDOM % $size))
echo "Mister ${array[$index]} is your candidate as reviewer. Congratulations!"
echo "In case you picked yourself - just rerun ;))"

# todo: externals can just select internals
# todo: exclude yourself (maybe by checking login name)
