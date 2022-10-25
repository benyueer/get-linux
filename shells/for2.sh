#! /usr/bin/bash

IFS=$'\n'

for name in $(cat $1)  # namelist
do 
  echo $name 
done
# 在未设置IFO且空行没有空格时，输出：name1\nfirst\nsecond，忽略了第二行的空行且第三行的空格也被切分了
# 设置后且空行没空格时，输出：name1\nfirst second
# 当空行有空格且设置IFO时，空行也被分割