---
layout: post

date: 2016-10-11
title: Linux Options Programmer's Manual Note
categories:
  - blog
  - note
tags:
  - linux c
  - api
---

## manual

### getopt

#### 用途

解析命令行参数

#### 语法

```
#include <unistd.h>
int getopt(int argc, char * const argv[], const char *optstring);
extern char *optarg;
extern int optind, opterr, optopt;

#include <getopt.h>
int getopt_long(int argc, char * const argv[], const char *optstring, const struct option *longopts, int *longindex);
int getopt_long_only(int argc, char * const argv[], const char *optstring, const struct option *longopts, int *longindex);
```

#### 描述

getopt函数解析命令行参数 `argc`和`argv`参数是程序被调用时传递给`main`函数的参数个数及参数数组 `argv`中元素如果以'-'开头（并不包括'-'或者'--'本身）那么该元素会被作为选项元素 元素字符就是改选项字符 如果`getopt`函数被多次调用，每个选项成员将会成功的返回选项字符

变量`optind`代表`argv`中下面要处理的实例的序号。系统会将其初始化为1 调用者可以重新设置其为1来重新遍历相同的`argv`或者遍历其他参数向量

如果`getopt`找到另一个选项字段 它将返回那个字段 更新`optind`外部变量和一个静态变量`nextchar`这样下次调用getopt可以重新扫描下面的选项或者argv元素

如果没有额外选项字段，getopt函数将返回-1。
这时`optind`值代表`argv`第一个不是选项字段的索引。

`optstring`是个包含合法选项字段的字符串。如果字段后面连接':'，说明该字段的选项需要一个参数，这种情况下getopt会将相同`argv`成员后续文本或者下一个`argv`成员文本指针存放在`optarg`中 两个':'表示选项可能是可选参数，如果在当前`argv`成员 它会返回到optarg中 或者optarg被设置为0 这个GNU扩展 如果`optstring`包含W

默认情况下，getopt发现不识别的选项字符时，会报错到标准错误中，并将不识别字符设置到`optopt`中，函数返回'?'。调用程序可以通过预先将`opterr`设置为0来避免默认报错的打印。如果

- 加载<getopt.h>头文件会引入变量`(int)optind` `(int)opterr` `(int)optopt` `(char *)optarg`
- 如果getopt找到一个没有定义在`optstring`中的选项字符或者需要参数的选项字符没有参数 函数返回'?' `optopt`设置为该字符 并且如果是未发现的选项 默认报错到标准出错中 如果不需要显示该报错 预先设置`opterr`为0即可


如果

如果getopt在`argv`中找到一个没有定义在`optstring`，或者它找到一个缺失参数选项，它返回'?'并且设置外部定义的变量`optopt`中实际的字段。如果`optstring`中首个字符

### getopt_long

`getopt_long`函数类似`getopt`函数，期待收到两个'-'的长选项 如果程序只接受长选项


## Code

```
#include <stdio.h>
#include <getopt.h>

int
main(int argc, char* argv[])
{
  int ret;
  printf("optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);

  // 避免发现不识别参数时，报错到标准出错
  opterr = 0;
  while ((ret = getopt(argc, argv, "ab:")) != -1) {
    if (ret == '?') {
      printf("find unkown option or find option missing argument\n");
    }

    printf("Loop optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);
  }

  printf("optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);

  return 0;
}

/**
 * Usage:
 * no argument
 * -a -b -c <==> -abc
 *
 * require argument
 * -a 123 -b 456 <==> -a123 -b456
 *
 * mix
 * -a -b -c 123 <==> -abc123
 */

```
