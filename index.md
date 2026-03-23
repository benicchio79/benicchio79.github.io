---
layout: home
title: Divagar
---
Memórias, reflexões e pensamentos para (sobre)viver a(a) distopia. Política, comunicação, cinema, paternidade, cidades e outras milongas.


<h2>Últimos posts</h2>
<ul class="post-list">
  {% for post in site.posts %}
    <li>
      <span class="post-date">{{ post.date | date: "%Y.%m.%d" }}</span>
      <a href="{{ post.url | relative_url }}" class="post-title">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
