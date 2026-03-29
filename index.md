---
layout: default
title: Divagar
---
<h3>Memórias, reflexões e pensamentos para (sobre)viver a(a) distopia.</h3>


<h2>{% include category-cloud.html %}</h2>

<h2>Mais recentes:</h2>
<ul class="post-list">
  {% for post in site.posts limit:10 %}
    <li>
      <a href="{{ post.url | relative_url }}" class="post-title">{{ post.title }}</a>
      <span class="post-date">{{ post.date | date: "%d.%m.%Y" }}</span>
    </li>
  {% endfor %}
</ul>
