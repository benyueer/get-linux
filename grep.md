## grep
全拼：Clobal search REgular expression and Print out the line
作用：文本搜索工具，根据用户指定的模式（过滤条件）对目标文本逐行进行匹配检查，打印匹配到的行
模式：由正则表达式的 元字符 及 文本字符 编写出来的过滤条件
```bash
语法：
grep [options] [pettern] file
命令  参数       匹配模式   文件数据
              -i：ignorecase，忽略大小写
              -o：仅显示匹配到的字符串本身
              -v：--invert-match，显示不能被匹配到的行
              -E：支持使用扩展的正则表达式元字符
              -q：--quiet，--slient，静默模式，不输出任何信息
              -n：显示行号
              --color=auto:关键词高亮
              -c：count，统计次数
```
grep命令是Linux中最重要的命令之一，功能是从`文本文件`或`管道数据流`中筛选出匹配的行和数据，再配合正则表达式，功能十分强大

grep命令的`匹配模式`就是你要找的东西，可以是普通的文本字符，也可以是正则表达式


```bash
cat /etc/passwd > /root/project/get-linux/pwd.txt

vim pwd.txt

grep -i "root" pwd.txt
# root:x:0:0:root:/root:/usr/local/bin/zsh
# operator:x:11:0:operator:/root:/sbin/nologin

grep -i -n "root" pwd.txt
# 1:root:x:0:0:root:/root:/usr/local/bin/zsh
# 10:operator:x:11:0:operator:/root:/sbin/nologin

# 统计pwd.txt中有多少行root  -c
grep -i -n -c "root" pwd.txt
# 2



```