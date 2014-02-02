---
layout: page
title: Relative
meta:
  description: Formats a date as a single relative amount.
date: 2013-12-31
tag: filter
status: [stable, active]
project: Jekyll-plugin
directory: relative
file:
  - relative.rb: script
---

# Relative

Have you checked how Wikipedia produces output like "1995; 18 years ago" in the
infoboxes ? They have a template for that : `{% raw %}{{start date and age|1995}}{% endraw %}`.

Well, I like such relative dates. I find them more human readable than absolute
dates.

## Usage

`relative` is a Liquid filter, so you just pass a date to it :

sample code -- Liquid template
{: .precaption .icon-code}

{% highlight jinja %}
Page last modified {% raw %}{{ page.date }}{% endraw %} ( {% raw %}{{ page.date | relative }}{% endraw %} ).
{% endhighlight %}

## Configuration

None.

## Versions

* 0.0 - December 2013
  * {: .added} Initial release.
{: .changelog}

## Plans

* {: .pending} Either optional parameter or a separate tag to express the value using integer amounts and multiple units.
{: .todo}

## Download

{% include filelist.md %}
