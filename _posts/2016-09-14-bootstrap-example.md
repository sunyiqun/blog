---
layout: post
title: "jekyll + bootstrap theme examples"
date: 2016-09-13 16:00:00 +0800
excerpt: bootstrap theme examples
categories:
  - guides
tag:
  - jekyll
  - bootstrap
---

### Tables

---

<div class="row">
  <div class="col-md-6">
    <table class="table table-striped">
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
</div>

### Thumbnails

---

{% raw %}
<img src="/blog/assets/images/188915-pokemon-go/png/pikachu.png" class="img-thumbnail" alt="pikachu" height="200" width="200">
{% endraw %}

### Labels

---

<h4>
{% for categorie in page.categories %}
  <span class="label label-default">{{ categorie }}</span>
{% endfor %}
</h4>

<h4>
{% for tag in page.tags %}
  <span class="label label-info">{{ tag }}</span>
{% endfor %}
</h4>


