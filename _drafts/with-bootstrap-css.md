---
layout: default
title: "With bootstrap css"
date: 2016-09-13 16:00:00 +0800
excerpt: Test bootstrap css within jekyll
---

## Effects With Code

### New Table

---

<div class="col-md-6">
<table class="table">
{% capture table %}

|\#|First|NameLast|NameUsername|
|---:|:---|:---|:---|
|1|Mark|Otto|@mdo|
|2|Jacob|Thornton|@fat|
|3|Larry|the Bird|@twitter|

{% endcapture %}
{{ table | markdownify | remove: '<table>' | remove: '</table>' }}
</table>
</div>

{% raw %}
```
<div class="col-md-6">
<table class="table">
{% capture table %}

|\#|First|NameLast|NameUsername|
|---:|:---|:---|:---|
|1|Mark|Otto|@mdo|
|2|Jacob|Thornton|@fat|
|3|Larry|the Bird|@twitter|

{% endcapture %}
{{ table | markdownify | remove: '<table>' | remove: '</table>' }}
</table>
</div>
```
{% endraw %}

### Thumbnails

---

Without Markdown

{% raw %}
<img data-src="/blog/assets/images/188915-pokemon-go/png/pikachu.png/200x200" class="img-thumbnail" alt="pikachu">
{% endraw %}



