---
layout: post
title:  "Welcome to Jekyll!"
date:   2016-07-08 09:36:25 +0800
categories: jekyll update
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

保存方便重用的文件，可以通过`{% include file.ext %}`将`_include/file.ext`文件包含进来

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

{% if jekyll.environment == "production" %}
	{% include disqus.html %}
{% endif %}

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






