---
layout: page
title: CPU Graph
meta:
  description: Highlights the OP's and own messages in a thread.
  keyword: highlight, author, member, handle, own, original, op
date: 2013-11-17
project: Desktop-gadget
directory: CPUGraph.Gadget
file:
  - cpugraph.css: style
  - cpugraph.html: document
  - cpugraph.js: script
  - gadget.xml: data
bstyle: |
  .cpu, .ram, .disk {
    color: yellow;
    text-shadow: white -1px 0, olive 1px 0;
    padding-left: 3px;
    padding-right: 3px;
  }
  .cpu {
    background-color: maroon;
  }
  .ram {
    background-color: green;
  }
  .disk {
    background-color: navy;
  }
---

# CPU Graph

There is CPU Meter installed by default. It shows the current CPU usage level. I
never understood why such tools are written. If you look at CPU Meter a second
after the CPU-expansive process terminated, you can't find out how high the peak
was.

So I wrote this little gadget, which displays the CPU usage similar to IceWM's
tray app.

## Screenshot

CPU Graph
{: .precaption .icon-screenshot}

![screenshot](cpu-graph.png)

## Usage

Just look and enjoy.

The displayed areas :

* CPU ( <span class="cpu">red</span> ) -- updated twice each second
* RAM ( <span class="ram">green</span> ) -- updated each 3 seconds
* Disk ( <span class="disk">blue</span> ) -- updated each 3 minutes

## Configuration

Configuration not really supported.

## Versions

* 0.0 - February 2013
  * {: .added} Initial release.

* 0.1 - March 2013
  * {: .changed} Update the areas with different frequency.
{: .changelog}

## Plans

* {: .pending} A large size view, where CPU cores and disk partitions to be
  displayed separately.
* {: .pending} Configuration to set the area sizes and update frequencies.
{: .todo}

## Download

{% include filelist.md %}
