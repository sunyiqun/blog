---
layout: post

date:
title: Linux Socket Programmer's Manual Note
categories:
  - blog
  - note
tags:
  - linux c
  - api
---

### manual

- accept
  - syntax

```
#include <sys/types.h>
#include <sys/socket.h>

int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen);

#define _GNU_SOURCE
#include <sys/socket.h>
int accept4(int sockfd, struct sockaddr *addr, socklen_t *addrlen, int flags);
```
  - usage

system call is used with connection-based socket (SOCK_STREAM, SOCK_SEQPACKET)
