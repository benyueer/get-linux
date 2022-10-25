#! /usr/bin/bash

ping -c 2 ${1} &>/dev/null  # $1 表示第一个参数  位置变量

# echo "$?"

if [ $? -eq 0 ]
then
  echo "$1 is on"
else 
  echo "$1 is not on"
fi