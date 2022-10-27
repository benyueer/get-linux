## bash是什么
- bash是一个命令处理器，运行在文本窗口中，执行用户输入的命令
- bash还能从文件中读取linux命令，称之为脚本
- bash支持通配符、管道、命令替换、条件判断等控制语句

## bash特性
- 命令行展开
  ```bash
  # 使用大括号 {} 
  echo change{01..100..2}
  # change01 change03 change05 change07 ....

  ```
- 命令别名
  ```bash
  # alias
  # 执行 alias 命令可以查看当前所有命令别名

  # 设置别名
  alias rm='rm -i'
  # 取消设置
  unalias rm  

  ```

- 命令历史
   ```bash
   # 查看命令记录
   history

   # 快速使用对应行号的命令 
   !行号
   # 上一次的命令
   !!
   ```

- 快捷键
  ```bash
  ctrl + a  移动到行首
  ctrl + e  移动到行尾
  ctrl + u  删除光标之前的字符
  ctrl + k  删除光标之后的字符
  ctrl + l  清空屏幕终端的内容（clear）

  ```

- 命令补全
  ```bash
  Tab
  ```

- 文件路径补全
  ```bash
  Tab
  ```

- 前后台控制
  ```bash
  & 在后台执行

  screen
  
  ^ z 转到后台 暂停
  jobs [-lrs] 查看所有挂起的任务
    l: 同时显示PID
    r: 仅显示正在后台 run 的作业
    s: 仅显示正在后台 暂停 的作业
  fg %1 返回 %代表作业号码
  # 例如先使用 vim编辑文件  此时想进行其他操作，可以使用 ^ z 命令挂起vim，操作完后使用 fg 回到vim

  bg %1 将后台的作业在 暂停 改为运行状态

  kill %1 关闭后台的作业 %表示作业序号

  ```
  - screen
    查看`screen.md`


  

- 输入输出重定向
  ```bash
  输出重定向：
    >   覆盖
      command > file	将输出重定向到 file
    >>  追加
      command >> file	将输出以追加的方式重定向到 file
  输入：
    <
      command < file	将输入重定向到 file
    << tag	将开始标记 tag 和结束标记 tag 之间的内容作为输入

    n > file	将文件描述符为 n 的文件重定向到 file。
    n >> file	将文件描述符为 n 的文件以追加的方式重定向到 file。
    n >& m	将输出文件 m 和 n 合并。
    n <& m	将输入文件 m 和 n 合并。
  ```

- 管道
  ```bash
  上一个命令的输出作为下一个命令的输入
  <!-- todo -->
  ```



## shell
### shell可以做什么
1. 自动化系统初始化（软件安装、时区设置、安全策略……）
2. 自动化批量软件部署
3. 管理应用程序
4. 日志分析处理
5. 自动化备份恢复程序
6. 自动化管理程序
7. 自动化信息采集及监控程序
8. 自动化扩容
9. shell可以做任何事情

### login nologin shell

### 命令排序
```bash
;(分号) 在一行执行多个命令，不具备逻辑判断

&& || 具备逻辑判断

```


### shell元字符
```bash
*
?
[]
()
(())
   整数扩展
{}
\
```

### shell变量
#### 什么是shell变量
用一个特定的字符串表示不固定的内容

#### 变量类型
1. 自定义变量
   1. 定义变量
      变量名=变量值     变量名以字母或下划线开头，区分大小写
      read
      `ping1.sh ping2.sh`
      读取命令参数  位置变量
      `ping3.sh`
   2. 引用变量
      $ + 变量名
      ${name}
   3. 查看变量
      echo
   4. 取消变量
      unset
   5. 作用范围
      仅当前shell
2. 环境变量
   1. 定义
      ```bash
      export ip=123.123.123.123
      # or
      ip = 123
      export ip
      ```
      环境变量在当前shell及子shell中生效
   2. 引用
3. 位置变量
   $1 $2 ${3}
4. 预定义变量
   1. $0  脚本名
   2. $*  所有参数
   3. $@  所有参数
   4. $#  参数个数
   5. $$  当前进程的PID
   6. $!  上一个后台进程的PID
   7. $?  上一个命令的返回值 0表示成功
   ```bash
    当 $* 和 $@ 不被双引号" "包围时，它们之间没有任何区别，都是将接收到的每个参数看做一份数据，彼此之间以空格来分隔。

    但是当它们被双引号" "包含时，就会有区别了：
    "$*"会将所有的参数从整体上看做一份数据，而不是把每个参数都看做一份数据。
    "$@"仍然将每个参数都看作一份数据，彼此之间是独立的。
   ```

#### 定义方式
1. 显式赋值
2. 命令替换
   ```bash
   $() or ``
   ```
3. read
#### 运算
1. 整数运算
   1. expr   + - \* / %
   2. $(())  + - * / % **
   3. $[]   
   4. let
2. 小数运算
   ```bash
   # 使用bc
   echo "scale=2;10/3" | bc

   ```
#### 修改和删除
1. 删除
    ```bash
    url=www.baidu.com

    # 1. 变量长度
    ${#url}  #13

    # 2. 从前匹配
    echo ${url#*.}    # baidu.com  从前往后匹配到第一个.  最短匹配
    echo ${url##*.}    # com  从前往后匹配到最后一个.  贪婪匹配

    # 3. 从后匹配
    echo ${url%.*}  # www.baidu
    echo ${url%%.*}  # www


    echo ${url#a.}


    ```
2. 索引及切片
   ```bash
   url=www.baidu.com
   echo ${url:0:5} # www.b
   echo ${url:5:5} # aidu.
   ```

3. 内容替换
  ```bash
  url=www.baidu.com
  echo ${url/baidu/sina}  # 只会修改第一个匹配的

  echo ${url//w/W}  # 替换所有匹配值
  ```

4. 变量的替代
   ```bash
   ${变量名:-新的变量值}
   变量没有被赋值，会赋予 -新的变量值-
   变量已被赋值，不会修改变量值
   ```

### 条件测试
```bash
格式1 test 条件表达式 
格式2 [ 条件表达式 ]
格式3 [[ 条件表达式 ]] 

man test # 查看test的参数用法
# 通用操作
!           # 取反 
e1 -a e2    # &&
e1 -o e2    # ||

```
1. 文件测试
   ```bash
   FILE1 -ef FILE2      # FILE1 and FILE2 have the same device and inode numbers  文件相同
   FILE1 -nt FILE2      # 1 比 2 新
   FILE1 -ot FILE2      # 1 比 2 旧
   -b FILE
         FILE exists and is block special
         文件存在且为 块

   -c FILE
         FILE exists and is character special
         文件存在且为

   -d FILE
         FILE exists and is a directory
         文件存在且为特殊字符

   -e FILE
         FILE exists
         文件存在

   -f FILE
         FILE exists and is a regular file
         文件存在且是普通文件

   -g FILE
         FILE exists and is set-group-ID

   -G FILE
         FILE exists and is owned by the effective group ID

   -h FILE
         FILE exists and is a symbolic link (same as -L)

   -k FILE
         FILE exists and has its sticky bit set

   -L FILE
         FILE exists and is a symbolic link (same as -h)

   -O FILE
         FILE exists and is owned by the effective user ID

   -p FILE
         FILE exists and is a named pipe

   -r FILE
         FILE exists and read permission is granted

   -s FILE
         FILE exists and has a size greater than zero
   -S FILE
              FILE exists and is a socket

   -t FD  file descriptor FD is opened on a terminal

   -u FILE
         FILE exists and its set-user-ID bit is set

   -w FILE
         FILE exists and write permission is granted

   -x FILE
         FILE exists and execute (or search) permission is granted
   ```
2. 数值比较
   ```bash
   # c风格
   (( 1<2 ))


   INTEGER1 -eq INTEGER2
              INTEGER1 is equal to INTEGER2

   INTEGER1 -ge INTEGER2
         INTEGER1 is greater than or equal to INTEGER2

   INTEGER1 -gt INTEGER2
         INTEGER1 is greater than INTEGER2

   INTEGER1 -le INTEGER2
         INTEGER1 is less than or equal to INTEGER2

   INTEGER1 -lt INTEGER2
         INTEGER1 is less than INTEGER2

   INTEGER1 -ne INTEGER2
         INTEGER1 is not equal to INTEGER2
   ```
3. 字符串比较
   ```bash
   # 正则使用双括号且~
   [[ $str =~ ^[a,b]+$ ]]

   -n STRING
              the length of STRING is nonzero
            STRING equivalent to -n STRING

   -z STRING
         the length of STRING is zero

   STRING1 = STRING2
         the strings are equal

   STRING1 != STRING2
         the strings are not equal
   ```
4. 模式匹配
   ```bash
   case 变量 in
   模式1)
      命令序列1
      ;;
   模式2)
      命令序列2
      ;;
   *)
      无匹配的命令序列
   esac

   一般 case 只用来匹配字符串，可以使用正则，使用正则时用 [] 
   匹配数字时最好使用 if
   ```

### 流程控制
1. if
   ```bash
   # 单分支结构
   if 条件测试 
   then 命令序列
   f1

   # 双分支结构
   if 条件测试 
   then 命令序列
   else 命令序列
   f1

   # 多分支结构
   if 条件测试 
   then 命令序列
   elif 条件测试2
   then 命令序列2
   elif 条件测试
   then 命令序列23
   f1
   ```
2. for
   ```bash
   # c风格
   for ((exp1; exp2; exp3))
   do
      statements
   done

   1) 先执行 exp1。
   2) 再执行 exp2，如果它的判断结果是成立的，则执行循环体中的语句，否则结束整个 for 循环。
   3) 执行完循环体后再执行 exp3。
   4) 重复执行步骤 2) 和 3)，直到 exp2 的判断结果不成立，就结束循环。

   count=0
   for ((i = 0; i< 10; i++))
   do
      count += 1
   done
   echo $count


   # python风格
   for i in value_list
   do 
      statements
   done

   对于value_list的取值，可以给出一个具体的值，也可以给定一个范围，还可以使用命令返回的结果，甚至使用通配符：
   1. 直接给出具体值，多个值以空格分隔，如：  1 2 3 4 5  \  'aa' 'sd' 'rer' 等
   2. 使用范围   {1..100}     
   3. 使用命令结果
   4. 使用通配符
   5. 使用特殊变量


   # 分隔符
   for在处理字符串时默认使用空格，要想使其换为回车，则需修改分隔符：
   IFS=$'\n'
   IFS='
   '
   ```

3. while与until
   ```bash
   while 条件测试
   do
      循环体
   done


   until 条件测试
   do
      循环体
   done
   ```

### FD(File Descriptors, 文件描述符)和命名管道实现并发控制
<!-- todo -->
- FD：文件描述符或文件句柄
   进程使用文件句柄来管理打开的文件
   0 是一个文件描述符，表示标准输入(stdin)
   1 是一个文件描述符，表示标准输出(stdout)
   2 是一个文件描述符，表示标准错误(stderr)
   ```bash
   ls /proc/$$/fd
   # 0  1  10  2
   ```


### 数组
1. 定义
   ```bash
   # 使用小括号表示数组，元素间用空格分隔
   # 数组元素不限制类型
   nums=(1 2 3 4 5 '6')
   # 使用命令返回值
   users=($(cat ./namelist))

   # 数组的长度没有限制，定义后可以增加元素
   nums[6]=12

   # 也可以只给特定下标赋值
   args=([3]=3 [5]='ads')
   ```
2. 获取数组元素
   ```bash
   ${nums[1]}

   # 使用* 或@ 获取所有元素
   ${nums[*]}
   ${nums[@]}

   # 获取切片  ${nums[*]:起始位置:长度}
   ${nums[*]:1:2}

   # 替换元素  ${nums[*]/查找字符/替换字符}   此操作不会修改数组本身，只会在返回值上有所体现
   ${nums[*]/name/Name}
   ```
3. 数组长度
   ```bash
   ${#nums[*]}
   ```
4. 删除元素或清空数组
   ```bash
   # unset 下标可以清除相应元素，不带下标则晴空整个数组
   unset nums[1]
   unset nums
   ```
5. 关联数组
   ```bash
   # 关联数组可以使用字符串作为索引

   # 定义
   # 要先使用声明语句将变量声明为关联数组
   declear -A assArray

   # 声明后可以使用两种方法将元素添加进来
   # 1. 利用 内嵌索引-列表值 的方法
   assArray=([lucy]=beijing [lili]=ahsnghai)
   # 2. 使用独立的 索引-值 进行赋值
   assArray[time]=2022

   # 获取关联数组的所有索引
   ${!assArray[*]}

   # 获取关联数组的所有值
   ${assArray[*]}

   # 获取关联数组的所有键值对
   for key in ${!assArray[@]}
   do
      echo "$key -> ${assArray[$key]}"
   done
   ```


### 函数
1. 函数定义
   1. 一般形式
      ```bash
      function name() {
         statements
         return vlaue
      }
      ```
      - function是 Shell 中的关键字，专门用来定义函数；
      - name是函数名；
      - statements是函数要执行的代码，也就是一组语句；
      - return value表示函数的返回值，其中 return 是 Shell 关键字，专门用在函数中返回一个值；这一部分可以写也可以不写。
   2. 简化写法
      ```bash
      # 不写 function 关键字
      name() {
         statements
         return value
      }

      # 如果写了 function 可以省略 name 后的括号
      function name {
         statements
         return value
      }
      ```
2. 函数调用
   ```bash
   # 如果没有参数，直接写 name 即可
   name

   # 如果传递参数，那么多个参数以空格分隔
   name param1 param2 param3

   函数调用要在函数定义后
   ```
3. 函数参数
   函数参数与脚本参数类似，可以使用`$n: $1 $2 $3`表示对应位置的参数
   `$#`可以获取参数的个数
   `$@ $*`获取所有参数
4. 函数的返回值
   shell 返回码最大255
   默认是由函数内最后一条命令的执行结果决定
   使用 return 可修改返回值，但最大255
   可以使用 echo 向标准输出返回特定值，在函数执行时将函数内的输出赋值给外部变量，但是非结果的东西不要给标准输出
   也可以定义全局变量，函数修改全局变量，外部读取变量
   

### shell内置命令
1. shift
   shift 将参数左移，常用于在不知道参数个数的情况下依次遍历每个参数

