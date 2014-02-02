---
layout: page
title: minesweeper.sh
meta:
  description: The classic mine sweeper game in text mode.
date: 2005-12-27
tag: game
status: [stable, inactive]
bstyle: |
  .w, .b, .l, .m { font-weight: bold; }
  .s { color: #e5e5e5; }
  .w { color: white; }
  .b { color: #0000ee; }
  .l { color: #00cd00; }
  .m { color: #cd00cd; }
  .r { color: #cd0000; }
  .y { color: black; background-color: #cdcd00; }
project: Bash-script
directory: minesweeper
file:
  - minesweeper.sh: script
  - minesweeper.sh.6: man page
  - minesweeper.sh.pod: man page source
---

# minesweeper.sh - the usual mine sweeper game

I always appreciated the simple games with original concept. The Mine Sweeper is one of them. Alas most of its implementations are in graphic mode and works only with
mouse. Since now, I already wrote a few Mine Sweeper programs which correct the above two misses. But this one is special for me. Mostly, because is my first game
written in shell script.

The code of this game is also on my favorites list, because excepting the unavoidable `tput` command, I used almost no external executables.

My thought on games is that they serve as relaxation tool for hard-working programmers. After several hours of coding is necessary to take a break. And play something.
I mean play. No race, no excitement. This is why I usually do not implement high scores, sound effects and similar useless things.

## Usage

minesweeper.sh usually has a nice color interface, but probably there are terminals on which fails to work :

sample output - `minesweeper.sh`
{: .precaption .icon-screen}

{% commandline %}
Mine Sweeper   version 1.0   december 2005   written by Feherke
board : S    size : 10*10   mine : 15   flag : 11   <span class="y">:)</span>
<span class="s"> # # # # # # # # # # </span>
<span class="s"> #<span class="w">[</span>#<span class="w">]</span># # # # # # # # </span>
<span class="s"> # # <span class="l">2</span> <span class="m">3</span> <span class="l">2</span> <span class="m">3</span> <span class="r">F F</span> <span class="l">2</span> <span class="b">1</span> </span>
<span class="g"> <span class="b">1</span> <span class="l">2</span> <span class="r">F</span> <span class="m">3</span> <span class="r">F</span> <span class="l">2</span> <span class="m">3 3</span> <span class="l">2</span> . </span>
<span class="g"> . <span class="b">1</span> <span class="l">2</span> <span class="r">F</span> <span class="l">2</span> <span class="b">1 1</span> <span class="r">F</span> <span class="b">1</span> . </span>
<span class="g"> . <span class="b">1</span> <span class="l">2 2</span> <span class="b">1</span> . <span class="b">1 1 1</span> . </span>
<span class="g"> . <span class="b">1</span> <span class="r">F</span> <span class="b">1</span> . . . . . . </span>
<span class="g"> <span class="b">1</span> <span class="l">2 2</span> <span class="b">1</span> . . . . . . </span>
<span class="g"> <span class="b">1</span> <span class="r">F</span> <span class="l">2</span> <span class="b">1</span> <span class="l">2 2 2</span> <span class="b">1</span> . . </span>
<span class="g"> <span class="b">1 1</span> <span class="l">2</span> <span class="r">F</span> <span class="l">2</span> <span class="r">F F</span> <span class="b">1</span> . . </span>
&lt;<b>h</b>/<b>j</b>/<b>k</b>/<b>l</b>&gt; Move &lt;<b>g</b>&gt; Step &lt;<b>f</b>&gt; Flag &lt;<b>n</b>/<b>N</b>/<b>m</b>/<b>M</b>&gt; New &lt;<b>q</b>&gt; Quit
{% endcommandline %}

For navigation there are available 3 sets of mappings :

| layout   | left         | down         | up           | right        | step             | flag         |
|----------|:------------:|:------------:|:------------:|:------------:|:----------------:|:------------:|
| Vi       | <kbd>h</kbd> | <kbd>j</kbd> | <kbd>k</kbd> | <kbd>l</kbd> | <kbd>g</kbd>     | <kbd>f</kbd> |
| Lefthand | <kbd>a</kbd> | <kbd>s</kbd> | <kbd>w</kbd> | <kbd>d</kbd> | <kbd>Space</kbd> | <kbd>f</kbd> |
| Numeric  | <kbd>4</kbd> | <kbd>2</kbd> | <kbd>8</kbd> | <kbd>6</kbd> | <kbd>Enter</kbd> | <kbd>0</kbd> |

Beside those, 3 additional commands exist :

| key          | command          |
|:------------:|------------------|
| <kbd>r</kbd> | redraw the board |
| <kbd>q</kbd> | quit the script  |

## Configuration

None.

However there are 4 predefined board setups and a new game starts by choosing one of them :

| key          | board  | size   | mines |
|:------------:|--------|:------:|------:|
| <kbd>n</kbd> | Small  | 10\*10 | 15    |
| <kbd>N</kbd> | Medium | 15\*15 | 33    |
| <kbd>m</kbd> | Large  | 20\*20 | 60    |
| <kbd>M</kbd> | Extra  | 30\*20 | 90    |


## Versions

* 1.0 - December 2005
  * {: .added} Initial release.

* 1.1 - August 2008
  * {: .changed} Minor optimizations.
  * {: .changed} Portable sh code replaced with Bash specific alternatives.
{: .changelog}

## Plans

* {: .pending} Would be nice to keep the high scores somewhere.
{: .todo}

## Download

{% include filelist.md %}
