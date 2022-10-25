#! /usr/bin/bash
ip='baidu.com'  # 显式赋值

ping -cl $ip &>/dev/null

echo "$?"

if [ $? -eq 0 ]
then
  echo "$ip is on"
else 
  echo "$ip is not on"
fi
