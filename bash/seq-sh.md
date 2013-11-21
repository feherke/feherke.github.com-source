---
layout: page
title: seq.sh
meta:
  description: Use the seq command to replace numeric part of a string with numeric sequences and multiplying the string.
date: 2004-12-25
project: Bash-script
directory: seq
file:
  - seq.sh: script
  - seq.sh.1: man page
  - seq.sh.pod: man page source
---

# seq.sh - embeded seq

Kind of embedded `seq`. Sometimes happens that you need a bunch of text lines with some periodically changing numeric values in them. Usually for download with `wget`.
But sadly, with all it's almost omnipotent parameters, using `wget` can be difficult if there is no index page with followable links or the thumbnails are messed between
the full size pictures. So you will have to do more single-file downloads instead of one recursive. And you will use the `-i` switch and an input file. But how you can
create that file easier ? Naturally, with a `for` and a `seq` :

Bash code - old, deprecated example
{: .precaption}

{% highlight bash %}
for i in `seq 10`; do wget http://example.com/public/file_$i.txt; done
{% endhighlight %}

<div markdown="1">
Note  
In meantime Bash's brace expansion was significantly improved :
{: .icon-info}

* Bash 2.05 introduced brace expansion for series of values `{a,b,c,d,e,f}`
* Bash 3.0 introduced sequence expansion for numbers `{1..10}` and letters `{a..z}`
* Bash 4.0 introduced sequence increment `{1..10..2}` and zero padding `{01..10}`

</div>
{: .note}

Bash code - new, modern example
{: .precaption}

{% highlight bash %}
wget http://www.example.com/public/file_{1..10}.txt
{% endhighlight %}

## Usage

seq.sh makes this easier. You just mark the expandable values and seq.sh will generate the list of strings. The marks are of form :

* `{[-w] [from [by]] to}` - the usual parameters for seq command
* `{#level}` - replace with the value of the given counter

For more details see the man page.

So this file :

sample input
{: .precaption}

{% commandline %}
http://www.example.net/archive/{2003 2004}-{-w 3 3 12}.zip
http://www.example.com/gallery{2}/pamela_a_{#1}/{3}_{#2}.jpg
{% endcommandline %}

will be transformed into this :

sample output - `seq.sh < input.txt`
{: .precaption .icon-screen}

{% commandline %}
http://www.example.net/archive/2003-03.zip
http://www.example.net/archive/2003-06.zip
http://www.example.net/archive/2003-09.zip
http://www.example.net/archive/2003-12.zip
http://www.example.net/archive/2004-03.zip
http://www.example.net/archive/2004-06.zip
http://www.example.net/archive/2004-09.zip
http://www.example.net/archive/2004-12.zip
http://www.example.com/gallery1/pamela_a_1/1_1.jpg
http://www.example.com/gallery1/pamela_a_1/2_2.jpg
http://www.example.com/gallery1/pamela_a_1/3_3.jpg
http://www.example.com/gallery2/pamela_a_2/1_1.jpg
http://www.example.com/gallery2/pamela_a_2/2_2.jpg
http://www.example.com/gallery2/pamela_a_2/3_3.jpg
{% endcommandline %}

## Configuration

None.

Not even command line parameters exist.

## Versions

* 1.0
  * {: .added} Initial release.

* 1.1 - December 2004
  * {: .added} Placeholders prefixed with hash ( # ) are replaced with the sequential value of the placeholder with the given order number.

* 1.2 - April 2008
  * {: .changed} Minor optimizations.
  * {: .changed} Portable sh code replaced with Bash specific alternatives.
{: .changelog}

## Plans

* {: .pending} Should be nice to make it to use character sequences and roman numbers. ( Ok, the second is just a joke. )
* {: .pending} As far as is used for URLs, the  `{` .. `}` markup is ok, but it should be setable through parameters.
{: .todo}

## Download

{% include filelist.md %}
