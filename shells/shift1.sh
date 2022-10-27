#! /usr/bin/bash

while [ $# -ne 0 ]
do
  let sum+=$1
  shift
done

echo "sum is: $sum"