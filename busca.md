---
layout: default
title: Busca
permalink: /busca/
---

## Assuntos:

{% include tag-cloud.html %}

## Busca:

{% include search.html %}

## Mais recentes:

<ul class="post-list">
  {% for post in site.posts limit:10 %}
    <li>
      <a href="{{ post.url | relative_url }}" class="post-title">{{ post.title }}</a>
      <span class="post-date">{{ post.date | date: "%Y.%m.%d" }}</span>
    </li>
  {% endfor %}
</ul>