---
layout: post
title: jekyll + bootstrap theme examples
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

### Alerts

<div class="page-header">
</div>
<div class="alert alert-success" role="alert">
<strong>Well done!</strong> You successfully read this important alert message.
</div>
<div class="alert alert-info" role="alert">
<strong>Heads up!</strong> This alert needs your attention, but it's not super important.
</div>
<div class="alert alert-warning" role="alert">
<strong>Warning!</strong> Best check yo self, you're not looking too good.
</div>
<div class="alert alert-danger" role="alert">
<strong>Oh snap!</strong> Change a few things up and try submitting again.
</div>
