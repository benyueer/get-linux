#! /usr/bin/bash

nums=(1 2 3 'qwe')

echo ${nums[*]}

nums[6]=45

echo ${nums[*]}

args=([3]=5 [6]='adsa')

echo ${args[*]}

users=($(cat ./namelist))
echo ${users[@]}


declare -A assArray

assArray=([first_name]=hello [second_name]=world)

assArray[time]=2022-10-25

echo ${!assArray[*]}
echo ${assArray[*]}

for key in ${!assArray[@]}
do
  echo "$key -> ${assArray[$key]}"
done

