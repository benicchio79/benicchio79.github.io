---
layout: default
title: Divagar
---
Memórias, reflexões e pensamentos para (sobre)viver a(a) distopia. Política, comunicação, cinema, paternidade, cidades e outras milongas.


## 🗂️ Categorias

{% include category-cloud.html %}

## 📝 Últimos posts

<h2>Últimos textos</h2>
<ul class="post-list">
  {% for post in site.posts %}
    <li>
      <span class="post-date">{{ post.date | date: "%Y.%m.%d" }}</span>
      <a href="{{ post.url | relative_url }}" class="post-title">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
