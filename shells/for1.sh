#! /usr/bin/bash

# c风格
count=0
for ((i = 0; i < 10; i++)); do
   ((count += 1))
done
echo $count

# python风格
count1=10
for i in 1 2 3 4 5
do
   ((count1 += i))
done
echo $count1


# 给出具体值
str=''
for s in 'a' 'is' 'a' 'char'
do
   # str="${str}${s}"
   str+=$s
done
echo $str

# 给出范围
sum=0
for i in {1..100}
do
   ((sum+=i))
done
echo $sum

for c in {A..z}
do
   printf "%c" $c
done
echo

# 使用命令的返回结果
sum1=0
for i in $(seq 2 2 100)
do 
   ((sum1+=i))
done
echo $sum1

for fliename in $(ls)
do 
   echo $fliename
done


# 使用shell通配符
for filename in *.sh
do 
   echo $filename
done

# 使用特殊变量   省略value_list时默认使用$@
for str in $@
do 
   echo $str
done