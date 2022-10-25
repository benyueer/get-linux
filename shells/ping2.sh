#! /usr/bin/bash
read -p '请输入ip：' ip   # 读取键盘输入  -p表示提示语句

ping -cl $ip &>/dev/null

echo "$?"

if [ $? -eq 0 ]
then
  echo "$ip is on"
else 
  echo "$ip is not on"
fi