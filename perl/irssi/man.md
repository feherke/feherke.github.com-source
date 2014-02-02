---
layout: page
title: Man
meta:
  description: Brief Irssi script developer manual.
date: 2012-02-21
status: [stable, active]
project: Irssi-script
directory: man
file:
  - man.pl: script
  - man: Irssi documentation converted for Man
---

# Man

The [Irssi manual](http://irssi.org/documentation/manual) is practically plain text. After using it a lot you really wish to have some text attributes too. So I added
them. And while Irssi is capable to display text attributes, I just wrote a script to spit a file on the screen.

The manual's content is copyright (c) 2000, Timo Sirainen. I tried to keep the original format as much as possible while made it suitable to display it one
chapter/section per page.

## Usage

Excerpt from the `/man help` command's output :

sample output
{: .precaption .icon-screen}

<pre><samp markdown="span"
>Syntax :
  man topic

Parameters :
  topic  - topic to display ( 56 available )
</samp></pre>

The "manual page" files have to be located in the directory pointed by the `man_path` setting and have .txt extension. You can put there any file with possible Irssish
formatting, for example :

reminder.txt
{: .precaption .icon-file}

<pre><code class="highlight"
><span class="cp">%U</span> Things to do <span class="cp">%U</span>
<span class="cp">%_</span>IM<span class="cp">%_</span> feherke <span class="cp">%r</span>ASALI<span class="cp">%n</span> ( as soon as logs in )

<span class="cp">%U</span> IDs to remember <span class="cp">%U</span>
<span class="cp">%_</span>feherke<span class="cp">%_</span> - the one who wrote the man script
</code></pre>

Then the `/man reminder` command will display it like this :

sample output
{: .precaption .icon-screen}

<pre><samp markdown="span"
>- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - man reminder
<u> Things to do </u>
**IM** feherke <span style="color: red">ASALI</span> ( as soon as logs in )

<u> IDs to remember </u>
**feherke** - the one who wrote the man script
</samp></pre>

## Configuration

Use the `/set` command to configure this script. The settings are queried when using them, so changes will be visible automatically on next use.

| Setting    | Type   | Description                  | Default            |
|------------|--------|------------------------------|--------------------|
| `man_path` | string | location of the manual files | .irssi/scripts/man |
{: .nowrap1}

## Versions

* 0.0 - ?
  * {: .added} Initial release.

* 0.1 - ?

* 0.2 - July 2008
{: .changelog}

## Plans

* {: .pending} Insert numbers after the links then accept them as parameter to display the given page.
* {: .pending} Add a separate command which parameter completion to cycle through the previous page's links.
* {: .pending} Implement apropos and whatis functionality.
{: .todo}

## Download

{% include filelist.md %}
