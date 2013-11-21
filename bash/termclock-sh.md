---
layout: page
title: termclock.sh
meta:
  description: Analog clock displayed using only bash arithmetics and tput.
date: 2008-09-10
project: bash-script
directory: termclock
file:
  - termclock.sh: script
  - termclock.sh.1: man page
  - termclock.sh.pod: man page source
---

# termclock.sh - draws an analog clock from letters

When I started to learn Linux I met two commands : `xclock` and `bc`. And I got the idea to imitate the first using the second.

You will see nothing from the original `bc` based implementations. I am not really proud of those.
The current version uses an "angle" table from which derives the needed sine &amp; cosine values then precalculates the positions. This makes it faster and uses less
resources. And of course, reduces the dependencies to `tput` only.

termclock.sh just indicates the time and indicates the time and...
You have to press <kbd>Ctrl-C</kbd> to stop it.

sample output - `termclock.sh`
{: .precaption .icon-screen}

{% commandline %}
&nbsp;                                      12

                    11                                    1



      10                                                                2




9                                 m  m o h                                    3
                             m m      s    h
                    m  m  m          s       h h
                                    s            h
                                   s
      8                           s                                     4
                                 s
                                s
                               s
                    7                                     5

                                       6
{% endcommandline %}

If you resize the terminal window in which runs, the clock gets resized.

## Configuration

None.

Not even command line parameters exist.

## Versions

* 1.0 - January 2004
  * {: .added} Initial release, just a proof of concept.

* 1.1
  * {: .changed} Transformed into usable script.

* 1.2 - August 2008
  * {: .changed} Optimized for speed by reducing the calls for `bc`.

* 1.3 - September 2008
  * {: .changed} Rewritten to use precalculated sin/cos table.
{: .changelog}

## Plans

* {: .pending} Make the hands to look less dashed.
* {: .pending} I could borrow some options from `xclock` to set the look and feel.
{: .todo}

## Download

{% include filelist.md %}
