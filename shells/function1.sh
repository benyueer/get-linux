#! /usr/bin/bash


function fun() {
  echo 'this is fun'
}
fun

function getSum() {
  local sum=0

  for i in $@
  do
    ((sum+=i))
  done

  return $sum
}

getSum 10 23 45

echo $?