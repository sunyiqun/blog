---
layout: post
title:  Jekyll docs
date:   2016-09-14 09:36:25 +0800
excerpt: jekyll guide
categories:
  - blog
  - guides
tags:
  - jekyll
---
You’ll find this post in your `_posts` directory. Go ahead and edit it and re-build the site to see your changes. You can rebuild the site in many different ways, but the most common way is to run `jekyll serve`, which launches a web server and auto-regenerates your site when a file is updated.

To add new posts, simply add a file in the `_posts` directory that follows the convention `YYYY-MM-DD-name-of-post.ext` and includes the necessary front matter. Take a look at the source for this post to get an idea about how it works.

Jekyll also offers powerful support for code snippets:

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

[jekyll-docs]: http://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/

## Jekyll Docs

### Requirements Install & Quick start

- Ruby
- RubyGems
- Nodejs
  - apt-get install nodejs

install jekyll & bundler
```
gem install jekyll bundler
```

create new site workspace
```
jekyll new mysite
```
if you want to install into an existing directory
```
jekyll new .
```
and if directory is not empty
```
jekyll new . --force
```
cd mysite
bundle install
bundle exec jeklly serve

gem install jekyll-redirect-from

### Usage
#### Jekyll Commond

> Jekyll translate text code into web site
`jekyll build` will read source path files and translate into web site files into destination.

`jekyll build --source <source> --destination <destination>`

**Destination directory will be clean first and fill with web site files, if destination dir is not empty and you need file cannot be remove, you need use specific keep_file option.**

`jekyll watch`检测source中文件变动，并更新 `_config.xml`文件更新生效必须要在重启命令后
`jekyll serve`启动本地web服务可以用于调试

### Directory structure

```
.
├── _config.yml 
├── _drafts
|   ├── begin-with-the-crazy-ideas.textile
|   └── on-simplicity-in-technology.markdown
├── _includes
|   ├── footer.html
|   └── header.html
├── _layouts
|   ├── default.html
|   └── post.html
├── _posts
|   ├── 2007-10-29-why-every-programmer-should-play-nethack.textile
|   └── 2009-04-26-barcamp-boston-4-roundup.textile
├── _data
|   └── members.yml
├── _site
├── .jekyll-metadata
└── index.html
```

- _config.yml

全局配置文件

- _drafts

草稿文件夹，用来保存未发布文章

- _includes

保存方便重用的文件，可以通过{% raw %}`{% include file.ext %}`{% endraw %}将`_include/file.ext`文件包含进来

- _layouts

布局是包裹文章外部的模板

- _posts

文章存放地，文章命名必须以2016-09-06-filename.markdown这种类似形式

- _data

数据存放地，会自动加载该目录下的yaml文件(.yml .yaml .json .csv) 可以通过`site.data`来访问 如果引用文件名称为members.yaml的文件 可以通过site.data.members

- .jekyll-metadata

该文件是jekyll生成临时文件

- index.html

目录下的.html .markdown .md .texttile都会自动转换

- Other file and Folders

### 配置文件 _config.yml

配置文件不能使用TAB符号

#### Files and Folders
- source:Dir

 源文件路径
 
- destination:Dir

目标文件路径

- Exclude:[DIR, FILE, ...]

转换时排除哪些文件

- include:[DIR, FILE, ...]

转换时强制加入哪些文件，因为以"."开头文件会被忽略，通常用来包含他们，例如".htaccess"

#### Handling Reading
- timezone: TIMEZONE

设置时区，用于RUBY的TZ变量

- encoding: ENCODING

- safe:Bool

禁用自定义插件

- defaults ?

### 环境变量

{% raw %}
{% if jekyll.environment == "production" %}
	{% include disqus.html %}
{% endif %}
{% endraw %}

通过`JEKYLL_ENV=production jekyll build`传入
JEKYLL_ENV模式值是development

### 头信息
头信息可以不设置

文件包含YAML头信息的文件都会被作为特殊文件处理

用于指定站点页面和文章的配置，设置一些布局或者自定义标题，抑或是给文章指定一个更精确的日期/时间
头信息必须在文件的开头部分，并且需要按照YAML格式写在两行三虚线之间

```
layout: post
title: Bloging
```
里面可以设置预定义变量及自定义变量，定义变量可以通过Liquid标签来访问
**UTF8编码最好不要出现DOM头字符**

#### 头信息中预定义的全局变量

- layout FILE
  指定布局文件，_layouts文件
- permalink URL
  修改文件默认路径
- published BOOL
  是否展示该文件
- category categorys
  将文件分到不同的标签中
- tags
  与上面类似

#### 头信息默认值

```
defaults:
  -
	scope:
		path: "" # 一个空的字符串代表项目中所有的文件
		type: "posts" # 限制只有posts类型
    values:
      layout: "default"
  -
	scope:
		path: "projects"
		type: "pages"
	values:
		layout: "project"
		author: "Mr. Hyde"
```

`{{ page.author }}` 调用自定义变量

type 有默认可选值，"pages" "posts" "drafts"对应相应目录 如果指定了path，则更改了对应目录
values 如果定义了非预定义变量，则作为可引用的liquid变量

kramdown 不支持`remove_block_html_tags` `remove_span_html_tags`

#### markdown选项

Jekyll支持`markdown`格式有额外渲染器

- Redcarpet

支持`extensions`，值为字符串数组

... TODO


### Blog

#### Filename

文章保存于`_post`文件夹中，文件名称以`YYYY-MM-DD-Title.MARKUP`格式，并且包含YAML头的文件都会转换成HTML格式

#### 下载及图片引用

- picture to show

```
![picture]({{ site.url }}/assert/images/png/player.png)
```

- file to download

```
[filename]({{ site.url }}/download/filename)
```

#### Display Posts

Thx for Liquid templete language. You can display posts in following way:
```
<ul>
	{% for post in site.posts %}
	# for contents
		<li>
			<a href="{{ post.url }}">{{ post.title }}</a>
		</li>
	{% endfor %}
</ul>
```

if u want to use current page variable, you can user `{{ page.xxx }}` invole.

Of course, you have full control over how (where) to display u posts, but u need to read template section carefully.

#### Post excerpt

文章摘要 jekyll文章可以通过post.excerpt进行预览 如果文章自身没有特定 则会抓取第一章节内容

或者可以通过在YAML头中定义`excerpt`或者`excerpt_separator`来定制


```
---
excerpt: "For markdown display"
---
```

or

```
---
excerpt_separator: <!--more-->
---

Excerpt
<!--more-->
Out-of-excerpt
```

你也在_config.xml中定义`excerpt_separator`，注意该值不能为空

同时，对于由 Liquid 标签输出的内容，你可以通过| strip_html过滤器来移除输出内容中的html标签。这在某些场景，如在你博文的head中生成meta="description"，以及其他html标签与内容不应混杂的场景下很有帮助。？

#### 代码高亮

Pygments 或 Rouge 

如下为Pygments语法 语法支持以下
ASP
Assembly
Awk
Basic
C
C#
C++
Cython
Emacs-Lisp
Erlang
Forth
Fortran
Haskell
Java
JavaScript
Lisp
Objective C
Other
Other Scripting Engines
PHP
PL/SQL
Pascal
Perl
Prolog
Python
Rexx
Ruby
SQL
Scheme
Tcl
Unix Shell
Visual
Basic
YACC
Zope

```
{% highlight ruby linenos %}
{% endhighlight %}
```

### Drafts

草稿，就是放在`_drafts`目录下
```
|-- _drafts/
|   |-- a-draft-post.md
```
可以通过--drafts参数传递给`jekyll build`或者`jekyll serve`时，可以自动附加时间用来预览，然而并没有看到


### 创建页面

创建html文件，可以以路径名称命令html文件，以可以创建对应目录，在对应目录下创建

或者通过YAML头文件中permalink重定向

## 变量

### 全局变量

- site

来自_config.yml文件全站信息与配置

|变量|说明|
|:---|:---|
|site.time|当前时间(Jekyll执行时间)|
|site.pages|所有 Pages 的清单|
|site.posts|一个按照时间倒序的所有 Posts 的清单|
|site.related_posts|如果当前被处理的页面是一个 Post，这个变量就会包含最多10个相关的 Post。默认的情况下，相关性是低质量的，但是能被很快的计算出来。如果你需要高相关性，就要消耗更多的时间来计算。用 jekyll 这个命令带上 --lsi (latent semantic indexing) 选项来计算高相关性的 Post。注意，GitHub 在生成站点时不支持　lsi。|
|site.static_files|静态文件的列表 (此外的文件不会被 Jekyll 和 Liquid 处理。)。每个文件都具有三个属性： path， modified_time 以及 extname。|
|site.html_pages|‘site.pages’的子集，存储以‘.html’结尾的部分。|
|site.html_files|‘site.static_files’的子集，存储以‘.html’结尾的部分。|
|site.collections|一个所有集合（collection）的清单。|
|site.data|一个存储了 _data 目录下的YAML文件数据的清单。|
|site.documents|每一个集合（collection）中的全部文件的清单。|
|site.categories.CATEGORY|所有的在 CATEGORY 类别下的帖子。|
|site.tags.TAG|所有的在 TAG 标签下的帖子。|
|site.[CONFIGURATION_DATA]|所有的通过命令行和 _config.yml 设置的变量都会存到这个 site 里面。 举例来说，如果你设置了 url: http://mysite.com 在你的配置文件中，那么在你的 Posts 和 Pages 里面，这个变量就被存储在了 site.url。Jekyll 并不会把对 _config.yml 做的改动放到 watch 模式，所以你每次都要重启 Jekyll 来让你的变动生效。|

- page

页面专属变量 + YAML头信息

|key|value|
|:---|:---|
|page.content|页面内容的源码|
|page.title|页面的标题|
|page.excerpt|页面摘要的源码|
|page.url|帖子以斜线打头的相对路径，例子： /2008/12/14/my-post.html|
|page.date|帖子的日期。日期的可以在帖子的头信息中通过用以下格式 YYYY-MM-DD HH:MM:SS (假设是 UTC), 或者 YYYY-MM-DD HH:MM:SS +/-TTTT ( 用于声明不同于 UTC 的时区， 比如 2008-12-14 10:30:00 +0900) 来显示声明其他 日期/时间 的方式被改写，|
|page.id|帖子的唯一标识码（在RSS源里非常有用），比如 /2008/12/14/my-post|
|page.categories|这个帖子所属的 Categories。Categories 是从这个帖子的 _posts 以上 的目录结构中提取的。举例来说, 一个在 /work/code/_posts/2008-12-24-closures.md 目录下的 Post，这个属性就会被设置成 ['work', 'code']。不过 Categories 也能在 YAML 头文件信息 中被设置。|
|page.tags|这个 Post 所属的所有 tags。Tags 是在YAML 头文件信息中被定义的。|
|page.path|Post 或者 Page 的源文件地址。举例来说，一个页面在 GitHub 上的源文件地址。 这可以在 YAML 头文件信息 中被改写。|
|page.next|当前文章在site.posts中的位置对应的下一篇文章。若当前文章为最后一篇文章，返回nil|
|page.previous|当前文章在site.posts中的位置对应的上一篇文章。若当前文章为第一篇文章，返回nil|

还可以调用自身定义的变量

- layout

Layout specific information + the YAML front matter. Custom variables set via the YAML Front Matter in layouts will be available here.

- content

content
被 layout 包裹的那些 Post 或者 Page 渲染生成的内容。但是又没定义在 Post 或者 Page 文件中的变量。

- paginator

设置了`paginate`就可以使用

|key|value|
|:---|:---|
|paginator.per_page|每一页 Posts 的数量|
|paginator.posts|这一页可用的 Posts|
|paginator.total_posts|Posts 的总数|
|paginator.total_pages|Pages 的总数|
|paginator.page|当前页号|
|paginator.previous_page|前一页的页号|
|paginator.previous_page_path|前一页的地址|
|paginator.next_page|下一页的页号|
|paginator.next_page_path|下一页的地址|

### 静态文件

单纯文件，可以通过`site.static_file`在页面中访问，还可以访问该文件的

|var_name|description|
|---|---|
|file.path|文件的相对路径|
|file.modified_time|文件的最后修改时间|
|file.extname|文件的扩展名，如 image.jpg 中的 .jpg|

### 集合

用于定义一种新的文档类型，使其拥有属性和命名空间

_config.yml

```
collections:
- my_collection
```

或者

```
collections:
  my_collection:
      foo: bar
```

```
defaults:
  - scope:
	  path: ""
	  type: my_collection
    values:
	  layout: page
```


### 迁移到jekyll上

> http://import.jekyllrb.com/docs/home/



