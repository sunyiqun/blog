---
layout: post
title:  "Jekyll Test"
date:   2016-09-09 16:35:36 +0800
categories: other
excerpt: "For markdown display"
---

## Test

### Word

---

`abc`

```
abc
```
*abc*

**abc**

> abc

- a
 - b
  -c

### Table

---

|1|2|3|
|:---|:---:|---:|
|1111111111|2222222222|3333333333|
|a|b|c|


### Picture

---

![pikachu]({{ site.baseurl }}/assets/images/188915-pokemon-go/png/pikachu.png)


### Code

---

{% highlight bash linenos %}
cd ~
for f in $(ls); do
	readlink -f $f;
done
{% endhighlight %}

{% highlight c linenos %}
#include <stdio.h>

int main()
{
	return 0;
}
{% endhighlight %}

{% highlight php linenos %}
<?php
header('Content-Type: application/json');

echo json_encode(array(
    'jsonrpc' => "2.0",
    'result' => $result,
    'id' => $request->id,
    'error' => null
));
{% endhighlight %}

### Var

|key|value|
|:---|:---|
|`site.time`| {{ site.time }} |
|`foreach site.pages`| PAGES={% for page in site.pages %}{{ page.url}}:{% endfor %} |
|`foreach site.posts`| POSTS={% for post in site.posts %}{{ post.url}}:{% endfor %} |
|`foreach site.related_posts`| RELATE={% for post in site.related_posts %}{{ post.url }}:{% endfor %} |
|`foreach site.static_files`| STATIC={% for static in site.static_files %}{{ static.url }}:{% endfor %} |



