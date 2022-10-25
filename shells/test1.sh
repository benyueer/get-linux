#! /usr/bin/bash
back_dir=/var/mysql_back

# if test -d $back_dir;then
if [ -d $back_dir ];then
  echo 开始备份。。。
else 
  echo 'no dir'

fi
