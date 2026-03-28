---
layout: default
title: Categorias
permalink: /categorias/
---

## 🗂️ Todas as categorias

<div class="tag-cloud">
  {% for category in site.categories %}
    {% assign cat_name = category[0] %}
    {% assign cat_count = category[1] | size %}
    <a href="#{{ cat_name | slugify }}" class="tag-link">
      {{ cat_name }} ({{ cat_count }})
    </a>
  {% endfor %}
</div>

{% for category in site.categories %}
  {% assign cat_name = category[0] %}
  {% assign cat_posts = category[1] %}
  <h2 id="{{ cat_name | slugify }}">{{ cat_name }}</h2>
  <ul class="post-list">
    {% for post in cat_posts %}
      <li>
        <span class="post-date">{{ post.date | date: "%Y.%m.%d" }}</span>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </li>
    {% endfor %}
  </ul>
{% endfor %}