---
layout: post

date: 2016-10-09
title: Linux IO Programmer's Manual Note
categories:
  - blog
  - note
tags:
  - linux c
  - api
---

## manual

### epoll

#### description

I/O 事件提醒机制

epoll API 作为运行类似poll任务来执行 监视多个文件描述符是否有I/O处理在他们身上 epoll API 可以既可以用来edge-triggered又可以用来level-triggered interface并且相对于大量文件描述符的监视也有所权衡 下列系统调用被提供用来创建并且管理epoll实例

- epoll_create 创建一个epoll实例并且返回一个文件描述符关联这个实例
- 关注特定文件描述符然后通过epoll_ctl来注册 这些文件描述符当前注册到一个epoll实例有时被称为一个epoll集合
- epoll_wait 等待I/O事件，如果当前没有有效的事件将阻塞当前调用进程



### syntax

```
#include <sys/epoll.h>


```

### epoll_create

#### description

epoll_create, epoll_create1 打开一个epoll文件描述符

`epoll_create`创建一个epoll实例 自liunx内核2.6.8以来，`size`参数被忽略了，但是必须大于0
(在最初的epoll_create的实现中，size参数用来通知linux内核需要添加到epoll实例中的文件描述符个数 内核将该参数作为初始化空间申请内部文件结构空间大小的(必要情况下，内核将会) 现如今，这个参考值已经不需要了(内核动态的进行)，但是size必须大于0，为了确保向后的兼容性当新的epoll应用在旧的内核版本中 )

epoll_create 返回一个文件描述符关联新的epoll实例，这个文件描述符后续所有epoll接口的调用 当不在需要时 这个文件描述符通过`epoll_create`创建，通过close消亡 当所有与epoll实例相关的文件描述符都被关闭的时候，内核销毁实例并释放与之相关的资源用于再次使用

#### syntax
o
```
#include <sys/epoll.h>

int epoll_create(int size);
int epoll_create1(int flags);
```
- 通用性
linux特定

- return
成功返回一个非负的文件描述符 失败情况下，返回-1并且errno会被设置

错误码
EINVAL size 为负
EMFILE 每个用户限制的epoll实例数`/proc/sys/fs/epoll/max_user_instances`到了
ENOMEM 创建内核对象的内存空间不足

### epoll_ctl

#### description

针对epoll实例(epfd文件描述符)执行控制操作的系统调用，它需要操作`op`执行在文件描述符`fd`上

对于`op`有效参数如下:
`EPOLL_CTL_ADD`添加文件描述符`fd`在epoll示例`epfd`上，并将文件描述符`fd`与事件`event`内部进行关联
`EPOLL_CTL_MOD`更改目标文件描述符`fd`的事件`event`
`EPOLL_CTL_DEL`移除文件描述符, 从epoll实例`epfd`中移除与之关联的文件描述符`fd`, `event`参数会被忽略可以为NULL

#### syntax

```
#include <sys/epoll.h>
int epoll_ctl(int epfd, int op, int fd, struct epoll_event *event);

typedef union epoll_data {
  void        *ptr;
  int          fd;
  uint32_t     u32;
  uint64_t     u64;
} epoll_data_t;

struct epoll_event {
  uint32_t events;
  epoll_data_t data;
}
```

`events`成员
EPOLLIN 关联文件可以进行读操作
EPOLLOUT 关联文件可以进行写操作
EPOLLRDHUP Stream socket对端关闭了连接，或者链接过程中关闭了写
EPOLLPRI 紧要文件需要进行读操作
EPOLLERR 错误条件发生在关联的文件描述符上，`oepoll_wait`总是等待该事件，无需设置
EPOLLHUP hang up 发生在关联的文件描述符上，`epoll_wait`总是等待该事件，无需设置
EPOLLET 设置epoll行为为Edge Triggered行为
EPOLLONESHOT 设置epoll行为one-shot
EPOLLWAKEUP

- return
  - 0 成功
  - -1 errno置位

EBADF `epfd`或者`fd`不是合法的文件描述符
EEXIST `op`是添加操作，`fd`已经添加到实例中
EINVAL `epfd`不是一个epoll文件描述符 或者`epfd`与`fd`相同 或者`op`不支持
ENOENT `op` 是更改或者参数操作 并且`fd`没有注册在`epfd`中
ENOMEM 没有足够的空间来处理`op`操作
ENOSPC `/proc/sys/fs/epoll/max_user_watches`当添加文件描述符时触到了限制
EPERM 文件描述符`fd`不支持添加到epoll中


通用性
linux特定

BUGS：
Linux 2.6.9 版本之前，`EPOLL_CTL_DEL`需要非NULL参数`event`, 尽管这样该参数还是会被忽略
Linux 2.6.9 版本之后，`EPOLL_CTL_DEL`可以指定一个空的`event`

### epoll_wait

```
#include <sys/epoll.h>

int epoll_wait(int epfd, struct epoll_event *events, int maxevents, int timeout);
int epoll_pwait(int epfd, struct epoll_event *events, int maxevents, int timeout, const sigset_t *sigmask);
```

#### description

epoll_wait是等待epoll实例`epfd`相关联的文件描述符`fd`事件发生的系统调用。指向`events`内存区域包含对于调用者可用的事件。最多到`maxevents`个事件将被`epoll_wait`返回。
`maxevents`需要最小为0

`timeout`

#### syntax

- poll
- epoll
