---
layout: post

date: 2016-09-11
title: Linux Err Programmer's Manual Note
categories:
  - blog
  - note
tags:
  - linux c
  - api
---

## manual

### errno
ISO C
NAME
  errno 最后一次发生错误的错误码
SYNOPSIS
  #include <errno.h>
DESCRIPTION
  <errno.h>头文件定义了整形变量`errno` 是系统调用或者某些库函数当发生错误事件时声明哪里发生了错误 当调用返回值是错误时(通常情况下返回-1或者NULL)它就会变得有意义 成功运行的函数有权利去修改`errno`的值
  有效的错误代码都是非零的 任何系统调用或者库函数都不允许将`errno`设置为0
  对于一些系统调用或者库函数来说，-1是执行成功情况下有效返回值 在这种情况下，一个成功返回值通过在调用前将`errno`设置为0来与发生错误进行区别 这时 如果调用返回了一个可能是一个错误发生了的状态，去检查`errno`值是否为0
  `errno`是通过ISO C标准定义的一个可变的左值int类型，但是不能显示的声明，errno可能是一个宏 `errno`是本地当前进程的(thread-local) 设置它在一个线程中不会影响其在其他线程
  所有错误名称定义在POSIX.1中必须有不同的值， EAGAIN and EWOULDBLOCK这两个异常可能是相同的
  
### err, verr, errx, verrx, warn, vwarn, warnx, vwarnx

用途:

格式化错误消息

- err 已传入参数作为退出码exit
- verr
- errx
- verrx
- warn
- vwarn
- warnx
- vwarnx

描述:

- 标准
  - nonStandard BSD extensions

语法:

{% highlight c %}
{% raw %}
#include <err.h>

void err(int eval, const char *fmt, ...);

void errx(int eval, const char *fmt, ...);

void warn(const char *fmt, ...);

void warnx(const char *fmt, ...);

#include <stdarg.h>

void verr(int eval, const char *fmt, va_list args);

void verrx(int eval, const char *fmt, va_list args);

void vwarn(const char *fmt, va_list args);

void vwarnx(const char *fmt, va_list args);
{% endraw %}
{% endhighlight %}

- err
  - 打印错误提示到错误输出, 格式: "<progname>:<custom-string>:<system-err-notify>", 如果err(eval, NULL)方式调用, 格式: "<progname>:<system-err-notify>"
  - rug


- 返回值

其他:

- error
- exit
- perror
- printf
- strerror

## Reference

[kernel.org](http://www.kernel.org/doc/man-pages/)
