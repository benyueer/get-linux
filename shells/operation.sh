#! /usr/bin/bash
num1=10
num2=20

expr $num1 + $num2  # 计算后显示
expr $num1 \* $num2  # 计算后显示

echo '$(())'
echo $(($num1 + $num2))
echo $((num1 * num2))
echo $((num1 % num2))
echo $((2**10))

echo '$[]'
echo $[1+2]
echo $[num1 ** num2]

echo 'let'
let num=1+2
echo $num