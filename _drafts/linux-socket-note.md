---
layout: post

date: 2016-09-30
title: Linux Socket Programmer's Manual Note
categories:
  - blog
  - note
tags:
  - linux c
  - api
---

## API Manual

### accept

#### 用途

系统调用 用于面向连接的socket(即socket类型为SOCK_STREAM, SOCK_SEQPACKET)

#### 描述

从`sockfd`监听的连接请求队列中取首个连接请求并根据`sockfd`设置创建新的socket文件描述符 新创建文件描述符不是监听状态，原先`sockfd`不受到影响

规范:

accept: POSIX.1-2001, SVr4, 4.4BSD

accept4: Linux extension

#### 语法

{% highlight c %}
#include <sys/types.h>
#include <sys/socket.h>

int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen);

#define _GNU_SOURCE
#include <sys/socket.h>
int accept4(int sockfd, struct sockaddr *addr, socklen_t *addrlen, int flags);
{% endhighlight %}

accept4是非规范的Linux扩展 linux (>= 2.6.28) libc ver()

参数:

`sockfd` [in] 需要以socket函数创建(参数type必须是SOCK_STREAM或者SOCK_SEQPACKET) bind函数进行绑定，listen函数进行监听后使用

`addr` [out] 返回对端socket结构 如果addr传入NULL，addrlen是没有意思的，应该也传入NULL，该情况下任何东西都不会被写入

`addrlen` [in&out] 传入addr长度，返回addr返回真实长度 如果提供缓冲区过小，返回addr可能会被截断，返回长度也会被传入长度长

`flags` [in] 

返回值:



#### 示例

int new_sockfd;

addrlen = sizeof(addr);
new_sockfd = accept(socfd, &addr, &addrlen);
if (new_sockfd) {
}

if (addrlen > sizeof(addr)) {
}



