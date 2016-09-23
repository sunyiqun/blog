---
layout: post

date: 2016-09-21 20:00:00 +0800
title: Liquid Note
categories:
  - blog
  - guides
tag:
  - liquid
---

## Liquid Note

---

### Tags

- theme
  - include 
    - 格式 {% raw %}{% include '<include file>' %}{% endraw %}
	- 被include的文件后缀为'.liquid'，该后缀可省略不写
    - 被include的文件会去访问其父文件声明的变量，可以通过{% raw %}{% include '<include file>', custom_var: 'apple', other_custom_var: 'banana' %}{% endraw %}方式为其声明变量
    - 被include的文件如果文件名与其中变量一直情况下，可以通过{% raw %}{% include 'color' with 'red' %}{% endraw %}

  - comment
    - 格式 {% raw %}{% comment %}<comment contents>{% endcomment %}{% endraw %}

  - form
    - 自动生成form表单 略

  - paginate
    - 分页 暂时略

### Filter

- common
  - default 默认值 (操作对象无效情况下)
  - date 格式化日期 ([format](http://strftime.net/))

- numerical
  - 取值
    - abs 取绝对值
    - floor 取整数部分 (12.1 -> 12)
    - ceil 取整数部分 (12.1 -> 13)
    - round 取小数点几位
  - 计算
    - plus 加法
    - minus 减法
    - times 乘法
    - divided_by 除法
    - modulo 余数

- string
  - 通用
    - size 长度
  - 大小写
    - capitalize 取首字母大写
    - downcase 取小写
    - upcase 取大写
  - 格式化
    - newline_to_br (\n -> {{ '<br>' | escape }})
    - lstrip 左侧去[:space:]
    - rstrip 右侧去[:space:]
    - strip 去[:space:]
    - strip_html 去html标签
    - strip_newlines 去换行
  - 编码
    - escape xml转码 (' -> &#39; & -> &amp;)
    - escape_once xml转码 (不会将escape过的内容再次escape)
    - url_encode url转码
  - 编辑
    - append 后面加
    - prepend 前面加
    - remove 删除匹配
    - remove_first 删除首次匹配
    - replace 替换匹配
    - replace_first 替换首次匹配
    - slice 截取
    - truncate 截取前几位或截取后并添加
    - truncatewords 截取前几个分隔符内容或截取后并添加

- array
  - 取值
    - first 第一个实例
    - last 最后一个实例
    - size 实例个数
	- <array>.[<idx>]
    - sort 排序
    - reverse 反序

  - 转换
    - map 将多子节点变量映射为数据
    - join 数组实例以指定分隔符衔接成字符串
    - split 字符串以指定分隔符分割成数组
	- uniq 去重
	- concat 数组合并
	- 

### reference

- [shopify.com](https://help.shopify.com/themes/liquid)
