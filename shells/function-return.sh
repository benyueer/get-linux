#! /usr/bin/bash

function fun() {
  read -p 'input a number: ' num
  # return $[2*$num]
  echo $[2*$num]
}

result=$(fun)

echo "$result aaa"

echo $?