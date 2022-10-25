#! /usr/bin/bash

for i in {2..255}
do 
  {
    ip="10.0.12.$i"
    ping -c1 $ip &>/dev/null
    if [ $? -eq 0 ];then
      echo "$ip is on"
    fi
  }&
done
wait
echo 'done'