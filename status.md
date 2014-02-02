---
layout: page
title: Status list
meta:
  description: List of pages by statuses
  keywords: status, classification
date: 2013-12-03
bstyle: |
  h2:target {
    border-style: dashed;
    border-width: 1px;
    border-color: #66f;
    padding-left: 3px;
  }
---

# Status list

{% for status in site.realstatus %}
## {{ status[0] }} {#{{ status[0] }}}
{% capture name %}{{ status[0] }}{% endcapture %}{{ site.status[name] }}
<ul>{% for page in status[1] %}
<li><a href="/{{ page | replace_first: '.md', '.html' }}">{{ site.real[page].title }}</a></li>{% endfor %}
</ul>
{% endfor %}
