---
layout: post
title:  "Jekyll Test"
excerpt: "For markdown display"
categories:
  - blog
  - note
tags:
  - jekyll
  - markdown
date:   2016-09-09 16:35:36 +0800
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

<figure class=highlight><pre><code class=language-bash data-lang=bash>bootstrap/
├── less/
├── js/
├── fonts/
├── dist/
│   ├── css/
│   ├── js/
│   └── fonts/
└── docs/
    └── examples/</code></pre></figure>

<figure class="highlight"><pre><code class="language-ruby" data-lang="ruby"><span class="cp"><span class="k">def</span> <span class="nf">print_hi</span><span class="p">(</span><span class="nb">name</span><span class="p">)</span>
  <span class="nb">puts</span> <span class="s2">"Hi, </span><span class="si">#{</span><span class="nb">name</span><span class="si">}</span><span class="s2">"</span>
  <span class="k">end</span>
  <span class="n">print_hi</span><span class="p">(</span><span class="s1">'Tom'</span><span class="p">)</span>
  <span class="c1">#=&gt; prints 'Hi, Tom' to STDOUT.</span></span></code></pre></figure>

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

{% highlight bash linenos=table %}
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
|`foreach site.pages url`| PAGES={% for page in site.pages %}{{ page.url}}:{% endfor %} |
|`foreach site.posts url`| POSTS={% for post in site.posts %}{{ post.url}}:{% endfor %} |
|`foreach site.related_posts url`| RELATE={% for post in site.related_posts %}{{ post.url }}:{% endfor %} |
|`foreach site.static_files path`| STATIC={% for static in site.static_files %}{{ static.path }}:{% endfor %} |
|`foreach site.html_pages`| ... |
|`site.html_files`| ... |
|`site.collections`| ... |
|`site.data`| ... |
|`site.documents`| ... |
|`site.categories.test url`| TEST={% for test in site.categories.test %}{{ test.url }}:{% endfor %} |
|`site.tags.TAG`| ... |
|`site.url`| {{ site.url }} |

|key|value|
|:---|:---|
|page.content| all content |
|page.title| {{ page.titile }} |
|page.excerpt| {{ page.excerpt }} |
|page.url| {{ page.url }} |
|page.date| {{ page.date }} |
|page.id| {{ page.id }} |
|page.categories| {{ page.categories }} |
|page.tags| {{ page.tags }} |
|page.path| {{ page.path}} |
|page.next| {{ page.next }} |
|page.previous| {{ page.preious }} |
