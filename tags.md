---
layout: default
title: Tags
permalink: /tags/
---

## 🏷️ Todas as tags

<div class="tag-cloud">
  {% for tag in site.tags %}
    {% assign tag_name = tag[0] %}
    {% assign tag_count = tag[1] | size %}
    <a href="#{{ tag_name | slugify }}" class="tag-link">
      {{ tag_name }} ({{ tag_count }})
    </a>
  {% endfor %}
</div>

{% for tag in site.tags %}
  {% assign tag_name = tag[0] %}
  {% assign tag_posts = tag[1] %}
  <h2 id="{{ tag_name | slugify }}">{{ tag_name }}</h2>
  <ul class="post-list">
    {% for post in tag_posts %}
      <li>
        <span class="post-date">{{ post.date | date: "%Y.%m.%d" }}</span>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </li>
    {% endfor %}
  </ul>
{% endfor %}