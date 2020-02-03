#!/bin/bash

# author:	Marcel Petrick (mail@marcelpetrick.it)
#
# about:	randomReviewer: solves the problem that (most of the time) nobody volunteers
#			to do a code-review.
#			Simply picks from an array of predefined identifiers.
#			Removes your own login-name from that array.
#
# license:	GNU General Public License v3.0

# initialize the array with all potential reviewers
array=(DAD GSH HGA KWL MDR MPE NKU RMA RSH BUN)

echo "---------------------------------------------------"

######################################################################
# remove myself from the potential reviewers based on the login name #
######################################################################
loginname=$(whoami)
# convert to uppercase
loginname=$(echo "${loginname^^}")
#echo "you are: $loginname - this should correspond to the three-character-alias"
#echo "--------------------------------"

# copy everything from "array" to "reviewers" except myself
reviewers=()
for elem in "${array[@]}"
do
    #echo "elem of array: $elem"
    if [ "$elem" != "$loginname" ]; then
        #echo "\tnot my name -> add"
        reviewers+=($elem)
    #else
        #echo "\t don't add!"
    fi
done

# end

#echo "--------------------------------"
#printf '%s\n' "${reviewers[@]}"

###################################################
# randomly pick a reviewer from the filtered list #
###################################################
size=${#reviewers[@]}
index=$(($RANDOM % $size))
echo "${reviewers[$index]} is your candidate as reviewer. Congratulations!"
