---
layout: default
title: Busca
permalink: /busca/
---

## 🏷️ Nuvem de tags

{% include tag-cloud.html %}

## 🔍 Campo de busca

{% include search.html %}

## 📝 Últimos posts

<ul class="post-list">
  {% for post in site.posts limit:10 %}
    <li>
      <span class="post-date">{{ post.date | date: "%Y.%m.%d" }}</span>
      <a href="{{ post.url | relative_url }}" class="post-title">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>