# screen
  GNU Screen是一款由GNU计划开发的用于命令行终端切换的自由软件。用户可以通过该软件同时连接多个本地或远程的命令行会话，并在其间自由切换
  GNU Screen可以看作是窗口管理器的命令行界面版本。它提供了统一的管理多个会话的界面和相应的功能
  - 特点
    - 会话恢复
    只要Screen本身没有终止，在其内部运行的会话都可以恢复。这一点对于远程登录的用户特别有用——即使网络连接中断，用户也不会失去对已经打开的命令行会话的控制。只要再次登录到主机上执行screen -r就可以恢复会话的运行。同样在暂时离开的时候，也可以执行分离命令detach，在保证里面的程序正常运行的情况下让Screen挂起（切换到后台）。这一点和图形界面下的VNC很相似。
    - 多窗口
    在Screen环境下，所有的会话都独立的运行，并拥有各自的编号、输入、输出和窗口缓存。用户可以通过快捷键在不同的窗口下切换，并可以自由的重定向各个窗口的输入和输出。Screen实现了基本的文本操作，如复制粘贴等；还提供了类似滚动条的功能，可以查看窗口状况的历史记录。窗口还可以被分区和命名，还可以监视后台窗口的活动。
    - 会话共享
    Screen可以让一个或多个用户从不同终端多次登录一个会话，并共享会话的所有特性（比如可以看到完全相同的输出）。它同时提供了窗口访问权限的机制，可以对窗口进行密码保护
  - 命令
    ```bash
    screen [-AmRvx -ls -wipe][-d <作业名称>][-h <行数>][-r <作业名称>][-s ][-S <作业名称>]

    参数说明
      -A 　将所有的视窗都调整为目前终端机的大小。
      -d <作业名称> 　将指定的screen作业离线。
      -h <行数> 　指定视窗的缓冲区行数。
      -m 　即使目前已在作业中的screen作业，仍强制建立新的screen作业。
      -r <作业名称> 　恢复离线的screen作业。
      -R 　先试图恢复离线的作业。若找不到离线的作业，即建立新的screen作业。
      -s 　指定建立新视窗时，所要执行的shell。
      -S <作业名称> 　指定screen作业的名称。
      -v 　显示版本信息。
      -x 　恢复之前离线的screen作业。
      -ls或--list 　显示目前所有的screen作业。
      -wipe 　检查目前所有的screen作业，并删除已经无法使用的screen作业。
    ```

  - 常用screen参数
    ```bash
      screen -S yourname -> 新建一个叫yourname的session
      screen -ls -> 列出当前所有的session
      screen -r yourname -> 回到yourname这个session
      screen -d yourname -> 远程detach某个session
      screen -d -r yourname -> 结束当前session并回到yourname这个session

      在每个screen session 下，所有命令都以 ctrl+a(C-a) 开始。
      C-a ? -> 显示所有键绑定信息
      C-a c -> 创建一个新的运行shell的窗口并切换到该窗口
      C-a n -> Next，切换到下一个 window 
      C-a p -> Previous，切换到前一个 window 
      C-a 0..9 -> 切换到第 0..9 个 window
      Ctrl+a [Space] -> 由视窗0循序切换到视窗9
      C-a C-a -> 在两个最近使用的 window 间切换 
      C-a x -> 锁住当前的 window，需用用户密码解锁
      C-a d -> detach，暂时离开当前session，将目前的 screen session (可能含有多个 windows) 丢到后台执行，并会回到还没进 screen 时的状态，此时在 screen session 里，每个 window 内运行的 process (无论是前台/后台)都在继续执行，即使 logout 也不影响。 
      C-a z -> 把当前session放到后台执行，用 shell 的 fg 命令则可回去。
      C-a w -> 显示所有窗口列表
      C-a t -> Time，显示当前时间，和系统的 load 
      C-a k -> kill window，强行关闭当前的 window
      C-a [ -> 进入 copy mode，在 copy mode 下可以回滚、搜索、复制就像用使用 vi 一样
          C-b Backward，PageUp 
          C-f Forward，PageDown 
          H(大写) High，将光标移至左上角 
          L Low，将光标移至左下角 
          0 移到行首 
          $ 行末 
          w forward one word，以字为单位往前移 
          b backward one word，以字为单位往后移 
          Space 第一次按为标记区起点，第二次按为终点 
          Esc 结束 copy mode 
      C-a ] -> Paste，把刚刚在 copy mode 选定的内容贴上
    ```
    [参考](https://www.cnblogs.com/mchina/archive/2013/01/30/2880680.html)

  - 使用 screen
    1. 安装
      ```bash
      yum install screen
      ```
    2. 创建新窗口
      ```bash
      screen -S name
      ```

  - 配置
    配置文件`~/.screenrc`

    常用配置：
    ```
    # 缓冲区行数
    defscrollback 10000

    # 支持鼠标滚轮
    termcapinfo xterm ti@:te@

    # 不显示欢迎屏幕
    startup_message off

    # 关闭闪屏
    vbell off

    # 状态栏
    hardstatus alwayslastline
    hardstatus string '%{= kg}[%{G}%H%{-}][ %{C}%-Lw%{+b g}[%{r}%n %{Y}%t%{-b g}]%{C}%+Lw%= %{G}][ %{C}S:%{b}(F1)[] (F2)< (F3)> (F4)<> %{C}V:%{b}(F5)| (F6)- (F7)> (F8)x %{kg}][ %Y/%m/%d %{G}%c %{g}]'

    # 快捷键
    # 窗口
    bindkey -k k1 title
    bindkey -k k2 prev
    bindkey -k k3 next
    bindkey -k k4 other
    # 视图拆分
    bindkey -k k5 split -v
    bindkey -k k6 split
    bindkey -k k7 focus
    bindkey -k k8 remove
    # 备用
    #bindkey -k k9 other
    #bindkey -k k; other
    #bindkey -k F1 other
    #bindkey -k F2 other
    ```


  - kill screen
    ```bash
    screen -S screenID -X quit
    ```


# screen替代品 Tmux
## 安装
```bash
yum install tmux
```
## 使用
1. 新建窗口  会话
    输入命令`tmux`，就进入了tmux窗口
    ```bash
    tmux new -s <session-name>  # 新建了一个会话
    ```
2. 退出
   ^+d 或 exit

3. kill会话
   ```bash
   tmux kill-session -t id/name
   ```

4. 常用命令
   ```bash
   # 查看所有会话
   tmux ls
   tmux list-session

   # 接入会话
   tmux attach -t id/name

   # 切换会话
   tmux switch -t id/name

   # 重命名
   tmux rename-session -t id name
   ```
5. 会话内快捷键
    ctrl+b 唤醒控制台，然后输入快捷键，命令如下：
   | key | 操作 |
   | --- | -- |
   | ? | 列出所有命令，q退出 |
   | d | 脱离当前会话，回到shell，使用attach回到会话 |
   | D | 选择要脱离的会话 |
   | ^+z | 挂起当前会话 |
   | r | 强制重绘未脱离的会话 |
   | s | 选择并切换会话 |
   | : | 进入命令模式 todo |
   | [ | 进入复制模式，与vi相同，q or esc 退出 |
   | ~ | 列出提示信息缓存 |
6. 窗口操作
   |key|action|
   |--|--|
   | c | 创建新窗口 |
   | & | 关闭当前窗口 |
   | 数字键 | 切换至指定窗口 |
   | p | 切换至上一窗口 |
   | n | 切换至下一窗口 |
   | l | 在前后两个窗口间切换 |
   | w | 通过窗口列表切换窗口 |
   | , | 重命名当前窗口 |
   | . | 修改当前窗口编号 |
   | f | 在所有窗口中搜索文本 |
   | " | 将当前面板切分为上下两块 |
   | % | 左右平分 |
   | x | 关闭当前面板 |
   | ! | 将当前面板置于新窗口 |
   | ctrl+方向键 | 以1个单元格为单位调整面板大小 |
   | alt+方向键 | 以5个单元格为单位调整面板大小 |
   | space | 在预制面板布局中循环 |
   | q | 显示面板编号 |
   | o | 在当前窗口中选择下一面板 |
   | 方向键 | 移动光标以选择面板 |
   | { | 向前置换当前面板 |
   | } | 向后置换当前面板 |
   | ctrl+o | 逆时针旋转当前窗口的面板 |
   | ctrl+O | 顺时针旋转 |

[参考](https://blog.csdn.net/gneveek/article/details/82803909)
[tmux](http://louiszhai.github.io/2017/09/30/tmux/#Tmux-Resurrect)
[tmux](https://www.kancloud.cn/kancloud/tmux/62464)