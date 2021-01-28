```bash

\[\e[37;40m\][\[\e[32;40m\]\u\[\e[37;40m\]@\h \[\e[36;40m\]\W\[\e[0m\]]\$

```
```bash
export PS1='\n\ne[1;37m[\e[m\e[1;32m\u\e[m\e[1;33m@\e[m\e[1;35m\H\e[m \e[4m`pwd`\e[m\e[1;37m]\e[m\e[1;36m\e[m\n$'
```

执行#source ~/.bashrc使其生效

    \d ：代表日期，格式为weekday month date，例如："Mon Aug 1" 

　　\H ：完整的主机名称。例如：我的机器名称为：fc4.linux，则这个名称就是fc4.linux 

　　\h ：仅取主机的第一个名字，如上例，则为fc4，.linux则被省略 

　　\t ：显示时间为24小时格式，如：HH：MM：SS 

　　\T ：显示时间为12小时格式 

　　\A ：显示时间为24小时格式：HH：MM 

　　\u ：当前用户的账号名称 

　　\v ：BASH的版本信息 

　　\w ：完整的工作目录名称。家目录会以 ~代替 

　　\W ：利用basename取得工作目录名称，所以只会列出最后一个目录 

　　\# ：下达的第几个命令 

　　\$ ：提示字符，如果是root时，提示符为：# ，普通用户则为：$


　      F    B

　　　　30  40 黑色

　　　　31  41 红色

　　　　32  42 绿色

　　　　33  43 黄色

　　　　34  44 蓝色

　　　　35  45 紫红色

　　　　36  46 青蓝色

　　　　37  47 白色

### 默认值`[\u@\h \W]\$`

   用户主机名称工作目录
   `\[\e[1;35m\]
   [
       \u
       @
       \h 
       \W
       ]
       \\$
       \[\e[0m\]
       `



\[\e[37;0m\](\[\e[35;0m\]\u\[\e[37;0m\]@\[\e[34;0m\]\H\[\e[37;0m\])\[\e[37;0m\]{\[\e[36;0m\]\W\[\e[37;0m\]}\[\e[37;0m\]-\[\e[31;0m\]\#\[\e[37;0m\]\$

\[\e[1;37m\]\#[\e[1;35m\]\u\e[1;37m\]@\h \e[1;36m\]\W]\\$\[\e[0m\]


\[\e[1;35m\]
[
\u
@\h \W]
\\$\[\e[0m\]

export PS1="\[\e[1;37m\]\#[\[\e[1;35m\]\u\[\e[1;37m\]@\h\[\e[1;36m\]\W\[\e[1;37m\]]\\$\[\e[0m\] "

![](mk_image/2021-01-08-17-19-31.png)



# PS2 
PS2一般使用于命令行里较长命令的换行提示信息

一个非常长的命令可以通过在末尾加 \ 使其分行显示

![1221](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9tbWJpei5xcGljLmNuL21tYml6X3BuZy9kbEV3SVZjS0dzNlZ3MVRZbURTRlJzcE9kcnNvVDhlaWFrOVl2ZGljdUFsVUJrRnRsUmljOHF0WDdGUWd5NGVybmliUWlhcnZIREtORFlzSHRUT0hyS2M2d3dBLzY0MA?x-oss-process=image/format,png)
