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

如果`getopt`找到另一个选项字符，它将返回那个字符，额外的，更新`optind`数值并且更新静态变量`nextchar`这样下次调用getopt可以恢复扫描下面的选项字符(-abcdef a,b,c,d,e,f分别为无参数选项时，可以连接使用)或者argv元素

如果没有额外选项字段，getopt函数将返回-1。
这时`optind`值代表`argv`第一个不是选项字段的索引。

`optstring`是个包含合法选项字符的字符集合。如果字段后面连接':'，说明该字段的选项需要一个参数，这种情况下getopt会将相同`argv`成员后续文本或者下一个`argv`成员文本指针存放在`optarg`中 两个':'表示选项可能是可选参数，如果在当前`argv`成员 它会返回到optarg中 或者optarg被设置为0

GNU扩展 如果`optstring`包含'W:'，那么'-W foo'会被当作一个长选项'--foo'这是GNU扩展 glibc 2.0以上支持 ? (how to use)

       By default, getopt() permutes the contents of argv as it scans, so that eventually all the nonoptions are at the end.  Two other modes are also implemented.  If the first charac‐
              ter of optstring is '+' or the environment variable POSIXLY_CORRECT is set, then option processing stops as soon as a nonoption argument is encountered.  If the  first  character
	             of  optstring  is  '-', then each nonoption argv-element is handled as if it were the argument of an option with character code 1.  (This is used by programs that were written to
		            expect options and other argv-elements in any order and that care about the ordering of the two.)  The special argument "--" forces an end of option-scanning  regardless  of  the
			           scanning mode.

默认情况下，当getopt()扫描

默认情况下，getopt发现不识别的选项字符时，会报错到标准错误中，并将不识别字符设置到`optopt`中，函数返回'?'。调用程序可以通过预先将`opterr`设置为0来避免默认报错的打印。如果

如果getopt在`argv`中找到一个没有定义在`optstring`，或者它找到一个缺失参数选项，它返回'?'并且设置外部定义的变量`optopt`中实际的字段。如果`optstring`中首个字符

- 加载<getopt.h>头文件会引入变量`(int)optind` `(int)opterr` `(int)optopt` `(char *)optarg`
- 如果getopt找到一个没有定义在`optstring`中的选项字符或者需要参数的选项字符没有参数 函数返回'?' `optopt`设置为该字符 并且如果是未发现的选项 默认报错到标准出错中 如果不需要显示该报错 预先设置`opterr`为0即可

- optopt 初始值为'?'，首次getopt后为'\0'，如果出现异常（发现不识别选项或者缺少参数的选项设置为该选项）



### getopt_long

getopt_long函数类似getopt函数，额外它还支持长选项，以'--'开头
(如果程序只接受长选项，那么`optstring`要设置成空串""，而不是NULL)
长选项名称可以被缩写，如果缩写是唯一的话或者有一个精确匹配的定义选项
一个长选项可以支持一个参数，以`--arg=param`或者`--arg param`格式

```
struct option {
  const char *name;
  int         has_arg;
  int        *flag;
  int         val;
};
```

name 长选项名称
has_arg no_argument (0) | required_argument (1) | optional_argument (1)
flag 找到长选项时返回值 如果flag为NULL 返回val 此外 getopt_long返回0，并且flag指针指向val 如果没找到，值不会改变
val 返回值，或者加载flag的值

### NOTE

- getopt 只支持字符选项
- getopt_long 支持字符选项，也支持字符串选项


## Code

```
#include <stdio.h>
#include <getopt.h>

int
main(int argc, char* argv[])
{
  int ret;
  const char *optstring = "ab:";
  const char *optstring0 = ":ab:"; // optopt set ':' instead of '?'
  const char *optstring1 = "+ab:"; // gnu extensions
  const char *optstring2 = "-ab:"; // gnu extensions

  printf("optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);

  // 避免发现不识别参数时，报错到标准出错
  opterr = 0;
  while ((ret = getopt(argc, argv, optstring)) != -1) {
    if (ret == '?') {
      printf("Option [%c] not support or missing argument\n", optopt);
    }

    printf("Loop optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);
  }

  printf("optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);
  printf("\n");

  optind = 1;
  while ((ret = getopt(argc, argv, optstring0)) != -1) {
    switch (ret) {
    case '?':
      printf("Option [%c] do not support\n", optopt);
      break;
    case ':':
      printf("Option [%c] missing argurment\n", optopt);
      break;
    }

    printf("Loop optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);
  }

  printf("optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);
  printf("\n");

  optind = 1;
  while ((ret = getopt(argc, argv, optstring1)) != -1) {
    if (ret == '?') {
      printf("Option [%c] not support or missing argument\n", optopt);
    }

    printf("Loop optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);
  }

  printf("optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);
  printf("\n");

  optind = 1;
  while ((ret = getopt(argc, argv, optstring1)) != -1) {
    if (ret == '?') {
      printf("Option [%c] not support or missing argument\n", optopt);
    }

    printf("Loop optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);
  }

  printf("optind=[%d], opterr=[%d], optopt=[%c], optarg=[%s]\n", optind, opterr, optopt, optarg);
  printf("\n");

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




#include <getopt.h>

void parse_argv(int argc, char *argv[])
{
  // const char *optstring = "";
  // if program only accept long option
  const char *optstring = "";
  const struct option longopts[] = {
    {"opt1", no_argument, },
    {"opt2", required_argument,},
    {"opt3", optional_argument,},
    {0, 0, 0, 0},
  };
  
  return 0;
}

/*
int main(int argc, char *argv[])
{
  parse_argv(argc, argv);
  return 0;
}
*/
```
