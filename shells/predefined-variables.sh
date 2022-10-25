#! /usr/bin/bash

echo $0  # 脚本名
echo $*  # 所有参数
echo $@  # 所有参数
echo $#  # 参数个数
echo $$  # 当前进程的PID
echo $!  # 上一个后台进程的PID
echo $?  # 上一个命令的返回值 0表示成功