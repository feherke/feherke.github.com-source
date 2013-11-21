---
layout: page
title: Debug
meta:
  description: Allows calling any method of the template variables.
  keyword: debug
date: 2013-11-17
project: Jekyll-plugin
directory: debug
file:
  - debug.rb: script
---

# Debug

Sometimes is not simple to guess why the variable set in the YAML front matter is not inserted as expected in the generated document. This plugin was initially written
to just display the class name of a variable.

Most of the time looking at output of the generator is easier than looking into the generated document. And always is easier to look at one generator output that looking
in all generated documents to check one value in each. That is why this plugin got its second filter, to `puts` the value to the output.

But the Ruby objects have many handy methods and the Liquid template allows using only a couple of them. So I just deleted everything and wrote a single filter : `call`.

Note  
In version 0.2 the `call` filter's name was `send`. Renamed in version 0.3 because some conflict.
{: .note .icon-info}

## Usage

`call` is a Liquid filter, so you just put it after the {% raw %}`{{ ` and `}}`{% endraw %} enclosed variable. The first parameter is the method name, the remaining
parameters are passed forward to the called method :

sample code -- Liquid template
{: .precaption .icon-code}

{% highlight jinja %}
Type of variable is {% raw %}{{ variable | call: 'class' | call: 'name' }}{% endraw %}
3rd letter of variable is {% raw %}{{ variable | call: '[]', 2 }}{% endraw %}
Print variable to stdout {% raw %}{{ variable | call: 'display' }}{% endraw %}
{% endhighlight %}

`log` is a Liquid filter which returns `nil`. It just writes the variable's value into the specified file, together with a timestamp.

sample code -- Liquid template
{: .precaption .icon-code}

{% highlight jinja %}
{% raw %}{{ variable | log: '/tmp/liquid.log' }}{% endraw %}
{% endhighlight %}

## Configuration

None.

## Versions

* 0.0 - October 2011
  * {: .added} Initial release.

* 0.1 - February 2012
  * {: .added} Added the `puts` filter.

* 0.2 - February 2012
  * {: .removed} Removed the `debug` and `puts` filter.
  * {: .added} Added the `send` filter.

* 0.3 - November 2013
  * {: .changed} Renamed the `send` filter to `call` as some conflict appeared since one of the updates.
  * {: .added} Added the `log` filter to write the input to a file.
{: .changelog}

## Plans

* {: .pending} Maybe some _really_ pretty printing. ( Sorry, not fan of `pp`. For now I will use `to_yaml`. )
{: .todo}

## Download

{% include filelist.md %}
