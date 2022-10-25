#! /usr/bin/bash

# 如果用户没有加参数
if [ $# -eq 0 ];then
  echo "no args; `basename $0` file"
  exit
fi

if [ ! -f $1 ];then
  echo "file error"
fi

for ip in `cat $1`
do
  ping -c1 $ip &>/dev/null
  if [ $? -eq 0 ];then
    echo "${ip} is on"
  else 
    echo "$ip is down"
  fi
done